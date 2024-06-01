import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/models/Message.dart';
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

  late List<Message> messages;

  @override
  void initState() {
    super.initState();
    messages = getDummyMessages();
  }

  TextEditingController searchController = TextEditingController();

  handleContextMenuButtonTap(String value) {
    switch (value) {
      case "1":
        // TODO Add functionality for showing message dialog here
      case "2":
        // TODO Add functionality for deleting message here
    }
  }

  void _showPopupMenu(BuildContext context, Offset offset) async {
    double left = offset.dx;
    double top = offset.dy;

    String? selected = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, left + 1, top + 1),
      items: [

        PopupMenuItem(value: "1",
          child: Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(appPadding),
            ),
            child: const Text("Show Message", style: TextStyle(
                color: textColor,
                fontSize: 15,
              fontWeight: FontWeight.w400
            ),),
          ),),

        PopupMenuItem(value: "2",
          child: Container(
            decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(appPadding),
            ),
            child: const Text("Delete Message", style: TextStyle(
              color: Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.w400),),),)
      ],
        shadowColor: blackColor,
        surfaceTintColor: whiteColor
    );

    // Perform actions based on the selected value
    if (selected != null) {
      switch (selected) {
        case "1":
        // TODO Add functionality for showing message dialog here
        case "2":
        // TODO Add functionality for deleting message here
      }
    }
  }

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
                          // TODO : Implement search here
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

              const SizedBox(
                height: appPadding * 2,
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
                       message:  messages[index],
                        onTap: (Offset offset) async {
                          _showPopupMenu(context, offset);
                         // PopupMenuButton<String>(
                         //   initialValue: "1",
                         //   itemBuilder: ((context) {
                         //     return const [
                         //
                         //       PopupMenuItem(value: "1",
                         //         child: Text("Show Message", style: TextStyle(
                         //           color: textColor,
                         //           fontSize: 15
                         //         ),),),
                         //
                         //       PopupMenuItem(value: "2",
                         //         child: Text("Delete Message", style: TextStyle(
                         //              color: Colors.red,
                         //             fontSize: 15),),),
                         //     ];
                         //   }),
                         //   onSelected: (value) => handleContextMenuButtonTap(value),
                         // );
                        },
                    )),
              )
            ],
          ),
    ));
  }
}

class SingleMessageListItemLayout extends StatefulWidget {
  const SingleMessageListItemLayout({super.key,
              required this.message, required this.onTap});

  final Message message;
  final Function(Offset offset) onTap;

  @override
  State<SingleMessageListItemLayout> createState() => _SingleMessageListItemLayoutState();
}

class _SingleMessageListItemLayoutState extends State<SingleMessageListItemLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: appPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Text(widget.message.name, style: const TextStyle(
                fontSize: 15,
                color: textColor,
                overflow: TextOverflow.ellipsis
              ),),

              Text(widget.message.dateAndTime, style: TextStyle(
                  fontSize: 15,
                  color: textColor.withOpacity(0.4),
                  overflow: TextOverflow.ellipsis
              ),)
            ],
          ),

          GestureDetector(
            onTapUp: (TapUpDetails details) {
              widget.onTap(details.globalPosition);
            },
              // onTap: widget.onTap,
              child: const Icon(Icons.more_vert, color: grey,)
          ),
        ],
      ),
    );
  }
}

