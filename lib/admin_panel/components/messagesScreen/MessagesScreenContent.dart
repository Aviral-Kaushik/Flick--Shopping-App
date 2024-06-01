import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessagesScreenContent extends StatefulWidget {
  const MessagesScreenContent({super.key});

  @override
  State<MessagesScreenContent> createState() => _MessagesScreenContentState();
}

class _MessagesScreenContentState extends State<MessagesScreenContent> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
              left: appPadding, right: appPadding, bottom: appPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AdminAppBar(),

              const SizedBox(
                height: appPadding,
              ),

              const Text("Messages",
                  style: TextStyle(
                      color: textColor, fontWeight: FontWeight.bold, fontSize: 25)),

              const SizedBox(
                height: 4,
              ),

              const Text(
                "This message are received from the contact us page",
                style: TextStyle(color: grey, fontSize: 11),
              ),

              const SizedBox(
                height: appPadding * 2,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Expanded(
                    child: Container(
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
                                borderSide: BorderSide(color: Colors.grey.shade200)),
                            labelText: "Email"),
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: appPadding / 2,
                  ),

                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO : Show Filter Dialog Box Here
                        },
                        style: ButtonStyle(backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          return blueThemeColor;
                        }), textStyle: MaterialStateProperty.resolveWith((states) {
                          return TextStyle(
                            color: whiteTextColor,
                            fontSize: 17,
                          );
                        })),
                        child: Text(
                              "Search",
                              style: TextStyle(
                                color: whiteTextColor,
                                fontSize: 17,
                              ),
                            ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
    ));
  }
}
