import 'package:flick/admin_panel/blocs/settings/settings_bloc.dart';
import 'package:flick/admin_panel/blocs/settings/settings_event.dart';
import 'package:flick/admin_panel/blocs/settings/settings_state.dart';
import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/components/widgets/SerachBarWithButton.dart';
import 'package:flick/admin_panel/components/widgets/dialogs/CreateNewAdminDialog.dart';
import 'package:flick/admin_panel/models/DetailsCardModel.dart';
import 'package:flick/helper/DialogHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/User.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AdminSettingsScreenContent extends StatefulWidget {
  const AdminSettingsScreenContent({super.key});

  @override
  State<AdminSettingsScreenContent> createState() => _AdminSettingsScreenContentState();
}

class _AdminSettingsScreenContentState extends State<AdminSettingsScreenContent> {

  final SettingsBloc settingsBloc = locator.get<SettingsBloc>();
  late DialogHelper dialogHelper;

  late DetailsCardModel? adminCardModel;
  late int totalAdmins;
  late List<User>? adminUsersList = List.empty();

  TextEditingController searchController = TextEditingController();

  bool isAnyDialogShowing = false;

  @override
  void initState() {
    super.initState();
    dialogHelper = DialogHelper(context);

    settingsBloc.add(const FetchAllAdmins());

    adminCardModel = DetailsCardModel(
      title: "Total Admins",
      count: 0,
      svgSrc: "assets/icons/Subscribers.svg",
      color: adminPanelPrimaryColor,
    );
  }

  showDeleteAdminDialog(User user) {
    isAnyDialogShowing = true;

    dialogHelper.showWarningDialog(
        "Are you sure want to remove this admin?",
        "Delete",
        "Cancel",
        () => deleteAdmin(user),
        Colors.redAccent, () {
      isAnyDialogShowing = false;
    });;
  }

  deleteAdmin(User user) {
    adminUsersList?.remove(user);
    settingsBloc.add(DeleteAdmin(user));
  }

  showCreateAdminDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            CreateNewAdminDialog(onPressed: (String email) {
              settingsBloc.add(CreateNewAdmin(email));
            }));
  }

  popAndShowSuccessfulDialog(String description) {
    Navigator.pop(context);

    isAnyDialogShowing = true;

    dialogHelper.showSuccessfulOrErrorDialog(
        "Success!", description, "Okay", false, () {
      isAnyDialogShowing = false;
    });
  }

  showProgressDialog(String message) {
    isAnyDialogShowing = true;
    dialogHelper.showProgressDialog(message, () {
      isAnyDialogShowing = false;
    });
  }

  showSuccessfulOrErrorDialog(String description, bool showUiForErrorMessage) {
    isAnyDialogShowing = true;
    dialogHelper.showSuccessfulOrErrorDialog(
        showUiForErrorMessage ? "Oops!" : "Success!", description,
        "Okay", showUiForErrorMessage, () {
      isAnyDialogShowing = false;
    });
  }

  dismissAllDialog() {
    if (isAnyDialogShowing) {
      Navigator.pop(context);
      isAnyDialogShowing = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (_) => settingsBloc,
      child: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {

          if (state is SettingsLoading) {
            dismissAllDialog();
            showProgressDialog(state.progressMessage);
          }

          if (state is AdminFetched) {
            dismissAllDialog();

            adminUsersList = state.admins;
            totalAdmins = state.admins.length;
            adminCardModel?.count = totalAdmins;

            setState(() {});
          }

          if (state is SettingsError) {
            dismissAllDialog();
            showSuccessfulOrErrorDialog(state.errorMessage, true);
          }

          if (state is NewAdminCreatedSuccessfully) {
            dismissAllDialog();
            showSuccessfulOrErrorDialog("Admin Access given successfully!", false);
          }

          if (state is AdminDeleteSuccessfully) {
            dismissAllDialog();
            showSuccessfulOrErrorDialog("Admin Deleted Successfully!", false);
            setState(() {});
          }

        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
                left: appPadding, right: appPadding, bottom: appPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const AdminAppBar(),

                const SizedBox(
                  height: appPadding,
                ),

                const Text("Settings", style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),),

                const SizedBox(
                  height: appPadding,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AdminChipCard(adminCardModel: adminCardModel!),

                    GestureDetector(
                      onTap: () {
                        showCreateAdminDialog();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(appPadding),

                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(appPadding),
                          boxShadow: [BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 4.5,
                              blurStyle: BlurStyle.outer,
                            )]
                        ),

                        child: const Center(
                          child: Icon(Icons.add, color: Colors.black)
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: appPadding * 2,
                ),

                SearchBarWithButton(
                  searchController: searchController,
                    onPressed: () {
                      settingsBloc.add(SearchAdmin(searchController.text));
                  }
                ),

                const SizedBox(
                  height: appPadding,
                ),

                Container(
                  padding: const EdgeInsets.all(appPadding),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(appPadding)
                  ),
                  child: Column(
                    children: [

                      Text("Admins List", style: TextStyle(
                        color: blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),

                      const SizedBox(
                        height: appPadding / 2,
                      ),

                      (adminUsersList != null && adminUsersList!.isNotEmpty) ? ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: adminUsersList!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              SingleAdminUserLayout(
                                  user: adminUsersList![index],
                                  onTap: () {
                                    showDeleteAdminDialog(adminUsersList![index]);
                                  }
                              )) : const Text("No admins found!"),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AdminChipCard extends StatefulWidget {
  const AdminChipCard({super.key, required this.adminCardModel});

  final DetailsCardModel adminCardModel;

  @override
  State<AdminChipCard> createState() => _AdminChipCardState();
}

class _AdminChipCardState extends State<AdminChipCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: appPadding, vertical: appPadding / 2),

      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(
        color: Colors.black.withOpacity(0.5),
        blurRadius: 4.5,
        blurStyle: BlurStyle.outer,
        offset: const Offset(0, 5),
      )]),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "${widget.adminCardModel.count}",
                style: const TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),

              const SizedBox(width: appPadding * 3,),

              Container(
                padding: const EdgeInsets.all(appPadding / 2),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: widget.adminCardModel.color?.withOpacity(0.1),
                    shape: BoxShape.circle),
                child: SvgPicture.asset(
                  widget.adminCardModel.svgSrc!,
                  color: widget.adminCardModel.color,
                ),
              )
            ],
          ),

          const SizedBox(width: appPadding * 2,),

          Text(
            "${widget.adminCardModel.title}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: textColor, fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class SingleAdminUserLayout extends StatefulWidget {
  const SingleAdminUserLayout({super.key,
        required this.user, required this.onTap});

  final User user;
  final Function() onTap;

  @override
  State<SingleAdminUserLayout> createState() => _SingleAdminUserLayoutState();
}

class _SingleAdminUserLayoutState extends State<SingleAdminUserLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: appPadding),
      padding: const EdgeInsets.all(appPadding / 2),
      child: Row(
        children: [

          ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                widget.user.profilePhoto,
                height: 38,
                width: 38,
                fit: BoxFit.cover,
              )),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    widget.user.name,
                    style: const TextStyle(
                        color: textColor, fontWeight: FontWeight.w600),
                  ),

                  Text(
                    widget.user.email,
                    style: TextStyle(
                        color: textColor.withOpacity(0.5), fontSize: 13),
                  ),
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: widget.onTap,
            child: const Icon(
              Icons.delete_outline,
              color: red,
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}


