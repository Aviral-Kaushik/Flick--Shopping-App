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
                    // padding: const EdgeInsets.all(appPadding),
                    // margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: searchBarBackgroundColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.text,
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
                  )
                ],
              ),
            ),

          ],
    ));
  }
}
