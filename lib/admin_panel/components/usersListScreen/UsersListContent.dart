import 'package:flick/admin_panel/blocs/users/users_bloc.dart';
import 'package:flick/admin_panel/blocs/users/users_event.dart';
import 'package:flick/admin_panel/blocs/users/users_state.dart';
import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/components/widgets/dialogs/filter_dialog.dart';
import 'package:flick/admin_panel/helper/user_product_filter.dart';
import 'package:flick/helper/DialogHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/User.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class UsersListContent extends StatefulWidget {
  const UsersListContent({super.key});

  @override
  State<UsersListContent> createState() => _UsersListContentState();
}

class _UsersListContentState extends State<UsersListContent> {

  UsersBloc usersBloc = locator.get<UsersBloc>();

  late DialogHelper dialogHelper;

  late List<User> usersData;
  late int totalNumberOfUsers;
  TextEditingController searchController = TextEditingController();

  bool isAnyDialogShowing = false;

  @override
  void initState() {
    super.initState();

    dialogHelper = DialogHelper(context);

    usersData = List.empty();

    usersBloc.add(const FetchAllUsers());

    searchController.addListener(() {
      usersBloc.add(SearchUser(searchController.text));
    });
  }

  showProgressDialog(String progressMessage) {
    isAnyDialogShowing = true;

    dialogHelper.showProgressDialog(progressMessage, () {
      isAnyDialogShowing = false;
    });
  }

  showSuccessAndErrorDialog(String message, bool showUIForErrorDialog) {
    isAnyDialogShowing = true;

    dialogHelper.showSuccessfulOrErrorDialog(
        showUIForErrorDialog ? "Oops!" : "Success",
        message,
        showUIForErrorDialog ? "Dismiss" : "Okay",
        showUIForErrorDialog, () {
          isAnyDialogShowing = false;
    });
  }

  dismissAllDialog() {
    if (isAnyDialogShowing) {
      Navigator.pop(context);
      isAnyDialogShowing = false;
    }
  }

  void showFilterDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => FilterDialog(
            filterToBeApplied: (UserProductFilter userFilter) {
              usersBloc.add(ApplyFilter(userFilter));
            }
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsersBloc>(
      create: (_) => usersBloc,
      child: BlocListener<UsersBloc, UsersState>(
        listener: (context, state) {

          if (state is UsersLoading) {
            dismissAllDialog();
            showProgressDialog(state.progressMessage);
          }

          if (state is FetchedAllUsers) {
            dismissAllDialog();
            usersData = state.users;
            totalNumberOfUsers = state.users.length;
            setState(() {});
          }

          if (state is UsersError) {
            dismissAllDialog();
            showSuccessAndErrorDialog(state.errorMessage, true);
          }

        },
        child: SafeArea(
            child: Column(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.only(
                      left: appPadding, right: appPadding, bottom: appPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AdminAppBar(),

                      const SizedBox(
                        height: appPadding,
                      ),

                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: searchBarBackgroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: searchController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade200
                              )
                            ),
                            labelText: "Search"
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 12,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(onPressed: () {
                            showFilterDialog();
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.resolveWith((states) {
                                return Colors.blueAccent;
                              }),
                            textStyle: MaterialStateProperty.resolveWith((states) {
                              return TextStyle(
                                  color: whiteTextColor,
                                  fontSize: 13,
                              );
                            })
                          ), child: Row(
                              children: [
                                const Icon(Icons.filter_list_alt,
                                    color: Colors.white),

                                const SizedBox(
                                  width: 8,
                                ),

                                Text(
                                  "Filter", style: TextStyle(
                                    color: whiteTextColor,
                                    fontSize: 13,
                                ),
                                ),
                              ],
                            ),),
                        ],
                      ),

                      const SizedBox(height: appPadding * 2,),

                      Container(
                        padding: const EdgeInsets.all(appPadding),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(appPadding)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const Text("Users", style: TextStyle(
                              color: textColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                            ),),

                            const SizedBox(height: appPadding,),

                            usersData.isNotEmpty
                            ? ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: usersData.length,
                                itemBuilder: (context, index) =>
                                    SingleUserListLayout(
                                      user: usersData[index],
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                            "/editUserScreen",
                                            arguments: {
                                              'user': usersData[index]
                                            }
                                        );
                                      },
                                    ))
                            : const Center(
                                child: Text("No Users Found!"),
                              ),
                      ],
                        ),
                      ),

                      const SizedBox(height: appPadding * 2,),

                    ],
                  ),
                ),
              ],
        )),
      ),
    );
  }
}

class SingleUserListLayout extends StatefulWidget {
  const SingleUserListLayout({super.key, required this.user,
    required this.onTap});

  final User user;
  final Function() onTap;

  @override
  State<SingleUserListLayout> createState() => _SingleUserListLayoutState();
}

class _SingleUserListLayoutState extends State<SingleUserListLayout> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: appPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              if (widget.user.profilePhoto.isNotEmpty)
                ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      widget.user.profilePhoto,
                      width: 60, height: 60,
                      fit: BoxFit.cover,
                    ))
              else
                SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CircleAvatar(
                      backgroundColor: btnYellowBackground,
                      child: Padding(
                        padding: const EdgeInsets.all(appPadding / 2),
                        child: Text(widget.user.name[0],
                            style: GoogleFonts.lato(
                            fontSize: 20,
                            color: blackColor,
                            fontWeight: FontWeight.w800)),
                      ),
                    ),
                  ),
                ),

              const SizedBox(width: appPadding,),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.user.name, style: const TextStyle(
                    color: textColor,
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis,
                  ),),

                  Text(widget.user.username, style: TextStyle(
                      color: textColor.withOpacity(0.4),
                      fontSize: 13,
                      overflow: TextOverflow.ellipsis,
                  ),),
                ],
              )
            ],
          ),

          GestureDetector(onTap: widget.onTap,
              child: const Icon(Icons.edit_note, color: grey)),
        ],
      ),
    );
  }
}

