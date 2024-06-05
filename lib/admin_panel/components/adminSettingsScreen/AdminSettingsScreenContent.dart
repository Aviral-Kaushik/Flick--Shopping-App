import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/components/widgets/SerachBarWithButton.dart';
import 'package:flick/admin_panel/components/widgets/dialogs/SuccessfulDialog.dart';
import 'package:flick/admin_panel/components/widgets/dialogs/WarningDialog.dart';
import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/admin_panel/models/DetailsCardModel.dart';
import 'package:flick/models/User.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdminSettingsScreenContent extends StatefulWidget {
  const AdminSettingsScreenContent({super.key});

  @override
  State<AdminSettingsScreenContent> createState() => _AdminSettingsScreenContentState();
}

class _AdminSettingsScreenContentState extends State<AdminSettingsScreenContent> {

  late DetailsCardModel adminCardModel;
  late int totalAdmins;
  late List<User> adminUsersList;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // TODO Fetch Admin Data Here
    totalAdmins = 12;

    adminCardModel = DetailsCardModel(
      title: "Total Admins",
      count: totalAdmins,
      svgSrc: "assets/icons/Subscribers.svg",
      color: adminPanelPrimaryColor,
    );

    adminUsersList = getUsersData().where((element) => element.isAdmin).toList();

  }

  showDeleteAdminDialog() {
    showDialog(context: context,
        builder: (BuildContext context) => WarningDialog(
            message: "Are you sure want to remove this admin?",
            firstBtnTitle: "Delete",
            secondBtnTitle: "Cancel",
            onPressed: () => deleteAdminAndShowSuccessfulDialog(),
            firstButtonColor: Colors.redAccent,));
  }

  deleteAdminAndShowSuccessfulDialog() {
    // TODO Add functionality for deleting admin
    Navigator.pop(context);
    showDialog(context: context, builder: (BuildContext context) => const SuccessfulDialog(
        title: "Success!",
        description: "Admin Deleted Successfully!",
        buttonText: "Okay"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                AdminChipCard(adminCardModel: adminCardModel),

                GestureDetector(
                  onTap: () {
                    // TODO Show Add new admin dialog here
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
                // TODO : Implement search here
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

                  ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: adminUsersList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          SingleAdminUserLayout(
                              user: adminUsersList[index],
                              onTap: () {
                               // TODO Show Remove Admin Dialog Here
                                showDeleteAdminDialog();
                              }
                          )),

                ],
              ),
            )
          ],
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


