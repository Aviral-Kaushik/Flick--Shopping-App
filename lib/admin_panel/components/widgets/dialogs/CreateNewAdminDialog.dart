import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class CreateNewAdminDialog extends StatelessWidget {
  const CreateNewAdminDialog({super.key, required this.onPressed});

  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(appPadding)
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: createNewAdminDialogContent(context),
    );
  }

  createNewAdminDialogContent(BuildContext context) {
    TextEditingController adminEditTextController = TextEditingController();
    return Container(
      padding: const EdgeInsets.only(
          top: appPadding * 1.5,
          bottom: appPadding * 1.5,
          right: appPadding,
          left: appPadding),

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
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Create New Admin", style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),),

              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Colors.grey,))
            ],
          ),

          const SizedBox(
            height: appPadding * 2,
          ),

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(40),
                  ),

                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 12
                    ),
                    controller: adminEditTextController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            borderSide: BorderSide(color: textFieldGreyBorder)),
                        labelText: "Enter email",
                        labelStyle: const TextStyle(
                          fontSize: 14
                        ),
                        helperText: "Enter mail for providing admin access",
                        helperStyle: TextStyle(
                          fontSize: 10,
                          color: darkGreyButtonBackground
                        )
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 20,
          ),

          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: GestureDetector(
              onTap: () {
                onPressed(adminEditTextController.text);
              },
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(vertical: appPadding / 2),

                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(appPadding * 2)
                ),

                child: Center(
                  child: Text("Provide Admin Access", style: TextStyle(
                    color: whiteColor,
                    fontSize: 14,
                  ),),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
