import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class UsersListContent extends StatefulWidget {
  const UsersListContent({super.key});

  @override
  State<UsersListContent> createState() => _UsersListContentState();
}

class _UsersListContentState extends State<UsersListContent> {

  TextEditingController searchController = TextEditingController();

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
                        // TODO : Show Filter Dialog Box Here
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith((states) {
                            return blueThemeColor;
                          }),
                        textStyle: MaterialStateProperty.resolveWith((states) {
                          return TextStyle(
                              color: whiteTextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
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
                                fontSize: 17,
                                fontWeight: FontWeight.w700
                            ),
                            ),
                          ],
                        ),),
                    ],
                  ),


                ],
              ),
            ),
          ],
    ));
  }
}
