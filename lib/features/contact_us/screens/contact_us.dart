import 'package:flick/admin_panel/blocs/messages/messages_bloc.dart';
import 'package:flick/admin_panel/blocs/messages/messages_event.dart';
import 'package:flick/admin_panel/blocs/messages/messages_state.dart';
import 'package:flick/helper/DialogHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/Message.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  final MessagesBloc messagesBloc = locator.get<MessagesBloc>();

  late final DialogHelper dialogHelper;

  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController messageTextController = TextEditingController();

  bool isAnyDialogShowing = false;

  @override
  initState() {
    super.initState();

    dialogHelper = DialogHelper(context);
  }

  headerAnimationWidget() {
    return Row(
      children: [
        Expanded(child: Lottie.asset("assets/animations/contact_us.json")),
      ],
    );
  }

  getInTouchCardWidget() {
    return Positioned(
      left: 30,
      right: 30,
      top: 250,

      child: Container(
        padding: const EdgeInsets.all(appPadding * 2),

        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(appPadding),
            boxShadow: const [
              BoxShadow(
                  color: Color(0xff0000001a),
                  blurRadius: 10.0,
                  spreadRadius: 2.0)
            ]),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Get in Touch",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: blackColor,
                        fontSize: 20))
              ],
            ),

            const SizedBox(
              height: appPadding,
            ),

            TextField(
              decoration: InputDecoration(
                labelText: "Name",
                alignLabelWithHint: true,
                  labelStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      color: blackColor
                  ),
                  contentPadding: const EdgeInsets.all(appPadding / 4)
              ),
              controller: nameTextController,
              textCapitalization: TextCapitalization.words,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 14, color: blackColor),
            ),

            const SizedBox(
              height: appPadding,
            ),

            TextField(
              decoration: InputDecoration(
                labelText: "E-mail",
                alignLabelWithHint: true,
                labelStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: blackColor
                ),
                contentPadding: const EdgeInsets.all(appPadding / 4)
              ),
              controller: emailTextController,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 14, color: blackColor),
            ),

            const SizedBox(
              height: appPadding,
            ),

            TextField(
              decoration: InputDecoration(
                labelText: "Message",
                alignLabelWithHint: true,
                  labelStyle:
                      GoogleFonts.poppins(fontSize: 14, color: blackColor),
                  contentPadding: const EdgeInsets.all(appPadding / 4)),
              controller: messageTextController,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 20,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400, fontSize: 14, color: blackColor),
            ),

            const SizedBox(
              height: appPadding * 2,
            ),

            sendButtonWidget(),
          ],
        ),
      ),
    );
  }

  sendButtonWidget() {
    return GestureDetector(
      onTap: () {
        if (nameTextController.text.isNotEmpty &&
            emailTextController.text.isNotEmpty &&
            messageTextController.text.isNotEmpty) {
          String subject = "";

          if (messageTextController.text.length >= 15) {
            subject = messageTextController.text.substring(0, 15);
          } else {
          }            subject = messageTextController.text
              .substring(0, messageTextController.text.length);


          messagesBloc.add(CreateNewMessage(Message(
              id: "0",
              name: nameTextController.text,
              contactEmail: emailTextController.text,
              subject: subject,
              message: messageTextController.text,
              dateAndTime: DateTime.now().toString())));
        }
      },
      child: Container(
        width: 50,
        height: 50,
        // padding: const EdgeInsets.all(appPadding / 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.blueAccent),

        child: const Center(
          child: Icon(
            LineAwesomeIcons.telegram,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  showSuccessfulOrErrorDialog(bool showErrorDialog) {
    isAnyDialogShowing = true;

    dialogHelper.showSuccessfulOrErrorDialog(
        showErrorDialog ? "Oops!" : "Success!",
        showErrorDialog
            ? "Something Went Wrong!"
            : "Thanks! Message Submitted Successfully",
        showErrorDialog ? "Dismiss" : "Okay",
        showErrorDialog, () {
      isAnyDialogShowing = false;
    });
  }

  showProgressDialog(String progressMessage) {
    isAnyDialogShowing = true;

    dialogHelper.showProgressDialog(progressMessage, () {
      isAnyDialogShowing = false;
    });
  }

  dismissAllDialogs() {
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
            showProgressDialog(state.progressDisplayMessage);
          }

          if (state is MessageCreatedSuccessfully) {
            dismissAllDialogs();
            showSuccessfulOrErrorDialog(false);
          }

          if (state is MessageError) {
            dismissAllDialogs();
            showSuccessfulOrErrorDialog(true);
          }

        },
        child: SafeArea(
          child: Scaffold(
              backgroundColor: primaryColor,

              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [

                  Expanded(
                    child: Stack(children: [
                      headerAnimationWidget(),

                      getInTouchCardWidget(),
                    ]),

                  ),
                ],
              )),
        ),
      ),
    );
  }
}
