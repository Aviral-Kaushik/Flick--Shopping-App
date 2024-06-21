import 'package:flick/admin_panel/blocs/messages/messages_bloc.dart';
import 'package:flick/admin_panel/blocs/messages/messages_event.dart';
import 'package:flick/admin_panel/blocs/messages/messages_state.dart';
import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/components/widgets/SerachBarWithButton.dart';
import 'package:flick/admin_panel/components/widgets/dialogs/ViewMessageDialog.dart';
import 'package:flick/admin_panel/helper/DialogHelper.dart';
import 'package:flick/admin_panel/helper/SnackbarHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/Message.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesScreenContent extends StatefulWidget {
  const MessagesScreenContent({super.key});

  @override
  State<MessagesScreenContent> createState() => _MessagesScreenContentState();
}

class _MessagesScreenContentState extends State<MessagesScreenContent> {

  late DialogHelper dialogHelper;
  late SnackBarHelper snackBarHelper;

  late List<Message> messages;

  final MessagesBloc messagesBloc = locator.get<MessagesBloc>();

  TextEditingController searchController = TextEditingController();

  bool isAnyDialogShowing = false;
  String query = "";

  @override
  void initState() {
    super.initState();

    messages = List.empty();

    messagesBloc.add(const FetchAllMessages());
    dialogHelper = DialogHelper(context);

    snackBarHelper = SnackBarHelper();
  }

  void _showPopupMenu(BuildContext context, Offset offset, Message message) async {
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
          showViewMessageDialog(message);
          break;
        case "2":
          showDeleteMessageDialog(message);
          break;
      }
    }
  }

  deleteMessage(Message message) {
    dismissAllDialog();
    messages.remove(message);
    messagesBloc.add(DeleteMessage(message));
    isAnyDialogShowing = false;
  }

  showViewMessageDialog(Message message) {
    isAnyDialogShowing = true;
    showDialog(
        context: context,
        builder: (BuildContext context) => ViewMessageDialog(
            message: message, shareReplyEmail: (String replyMessage) {
              Navigator.pop(context);
              messagesBloc.add(SendReplyEmail(message.contactEmail, replyMessage));
        })).then((value) {
          isAnyDialogShowing = false;
    });
  }

  showDeleteMessageDialog(Message message) {
    isAnyDialogShowing = true;
    dialogHelper.showWarningDialog(
        "Are you sure want to delete this message?",
        "Delete",
        "Cancel",
        () {
          deleteMessage(message);
        },
        Colors.redAccent,
        () {
          isAnyDialogShowing = false;
        });
  }

  showSuccessfulOrErrorDialog(String description, bool showUiForErrorMessage) {
    isAnyDialogShowing = true;
    dialogHelper.showSuccessfulOrErrorDialog(
        "Success!", description,
        "Okay", showUiForErrorMessage, () {
          isAnyDialogShowing = false;
    });
  }

  showProgressDialog(String message) {
    isAnyDialogShowing = true;
    dialogHelper.showProgressDialog(message, () {
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
    return BlocProvider<MessagesBloc>(
      create: (_) => messagesBloc,
      child: BlocListener<MessagesBloc, MessagesState>(
        listener: (context, state) {
          if (state is MessageLoading) {

            dismissAllDialog();
            showProgressDialog(state.progressDisplayMessage);

          }

          if (state is MessageFetched) {

            messages = state.messages;
            setState(() {});
            dismissAllDialog();

          }

          if (state is MessageError) {

            dismissAllDialog();
            showSuccessfulOrErrorDialog(state.errorMessage, true);

          }

          if (state is ReplyEmailSentSuccessfully) {

            dismissAllDialog();
            showSuccessfulOrErrorDialog("Reply email! Sent Successfully", false);

          }

          if (state is MessageDeletedSuccessfully) {

            setState(() {});
            dismissAllDialog();
            showSuccessfulOrErrorDialog("Message Deleted Successfully", false);

          }
        },
        child: SafeArea(
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

                  SearchBarWithButton(
                      searchController: searchController,
                      onPressed: () {
                        messagesBloc.add(FilterMessages(searchController.text));
                      }
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
                    child: (messages.isNotEmpty) ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: messages.length,
                        itemBuilder: (context, index) => SingleMessageListItemLayout(
                           message:  messages[index],
                            onTap: (Offset offset) async {
                              _showPopupMenu(context, offset, messages[index]);
                            },
                        )) : const Center(child: Text("No Messages Found!"),),
                  )
                ],
              ),
        )),
      ),
    );
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

