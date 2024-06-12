import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/components/widgets/dialogs/FilterUserDialog.dart';
import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/admin_panel/helper/UserFilter.dart';
import 'package:flick/models/User.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class UsersListContent extends StatefulWidget {
  const UsersListContent({super.key});

  @override
  State<UsersListContent> createState() => _UsersListContentState();
}

class _UsersListContentState extends State<UsersListContent> {

  late List<User> usersData;
  late int totalNumberOfUsers;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usersData = getUsersData();
    totalNumberOfUsers = 10;
  }

  showFilterDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => FilterUserDialog(
            filterToBeApplied: (UserFilter userFilter) {
              // TODO Fetch and apply user filter logic
            }
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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

                  // TODO Implement Pagination Here like show 10 user on single page then next page
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

                        ListView.builder(
                          physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: usersData.length,
                            itemBuilder: (context, index) => SingleUserListLayout(
                              user: usersData[index],
                              onTap: () {
                                // TODO Open Edit User Page Here
                              },
                            )),
                      ],
                    ),
                  ),

                  const SizedBox(height: appPadding * 2,),

                ],
              ),
            ),
          ],
    ));
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

              // ClipRRect(
              //     borderRadius: BorderRadius.circular(30),
              //     child: Image.network(
              //       widget.user.profilePhoto,
              //       width: 60, height: 60,
              //       fit: BoxFit.cover,
              //     )),

              ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    widget.user.profilePhoto,
                    width: 60, height: 60,
                    fit: BoxFit.cover,
                  )),

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

