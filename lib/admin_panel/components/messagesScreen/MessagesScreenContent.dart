import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/models/Message.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class MessagesScreenContent extends StatefulWidget {
  const MessagesScreenContent({super.key});

  @override
  State<MessagesScreenContent> createState() => _MessagesScreenContentState();
}

class _MessagesScreenContentState extends State<MessagesScreenContent> {

  late List<Message> messages;

  @override
  void initState() {
    super.initState();
    messages = getDummyMessages();
  }

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
                    flex: 2,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(40),
                      ),

                      child: TextField(
                        keyboardType: TextInputType.text,
                        controller: searchController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide(color: textFiedGreyBorder)),
                            labelText: "Email"),
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: appPadding / 2,
                  ),

                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 50,

                      child: ElevatedButton(
                        onPressed: () {
                          // TODO : Show Filter Dialog Box Here
                        },
                        style: ButtonStyle(backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          return blackColor;
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
              ),

              Container(
                padding: const EdgeInsets.all(appPadding),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(appPadding)
                ),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) => SingleMessageListItemLayout(
                       message:  messages[index]
                    )),
              )
            ],
          ),
    ));
  }
}

class SingleMessageListItemLayout extends StatefulWidget {
  const SingleMessageListItemLayout({super.key, required this.message});

  final Message message;

  @override
  State<SingleMessageListItemLayout> createState() => _SingleMessageListItemLayoutState();
}

class _SingleMessageListItemLayoutState extends State<SingleMessageListItemLayout> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

