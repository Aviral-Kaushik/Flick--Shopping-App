import 'package:flick/models/Message.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class ViewMessageDialog extends StatelessWidget {
  ViewMessageDialog({super.key,
    required this.message, 
    required this.shareReplyEmail});

  final Message message;
  final Function(String reply) shareReplyEmail;

  TextEditingController replyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(appPadding)
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      child: viewMessageDialogContent(context),
    );
  }
  
  viewMessageDialogContent(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(appPadding),

        decoration: BoxDecoration(
          color: whiteColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(appPadding),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0)
            )
          ]
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const SizedBox(
              height: appPadding,
            ),

            const Text("Process Message", style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),),

            const SizedBox(
              height: appPadding,
            ),

            const Divider(color: Color(0xffdddddd),),

            const SizedBox(
              height: appPadding,
            ),

            Text(
              message.subject,
              style: TextStyle(
                  color: textColor.withOpacity(0.7),
                  fontSize: 15),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),

            const SizedBox(
              height: appPadding / 2,
            ),

            SizedBox(
              height: 100,
              child: Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    message.message,
                    style: TextStyle(
                        color: textColor.withOpacity(0.7),
                        fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 50,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: appPadding * 2,
            ),

            SingleChildScrollView(
              child: TextFormField(
                minLines: 5,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                controller: replyController,

                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.blueAccent
                        )
                    ),

                    hintText: "Reply",
                    // TODO Add functionality for showing error
                    // errorText: "Invalid Message"
                ),
              ),
            ),

            const SizedBox(
              height: appPadding * 2,
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Expanded(
                child: GestureDetector(
                  onTap: () => shareReplyEmail(replyController.text),
                  child: Container(
                    padding: const EdgeInsets.all(appPadding / 2),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(appPadding)
                    ),
                    child: Center(
                      child: Text("Send Reply", style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16
                      ),),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: appPadding / 2,
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.all(appPadding / 2),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(appPadding)
                    ),
                    child: const Center(
                      child: Text("Dismiss", style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                      ),),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
