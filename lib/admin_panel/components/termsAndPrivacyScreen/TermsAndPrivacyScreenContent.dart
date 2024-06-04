import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/components/widgets/dialogs/SuccessfulDialog.dart';
import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsAndPrivacyScreenContent extends StatefulWidget {
  const TermsAndPrivacyScreenContent(
      {super.key, required this.showUIForPrivacyPolicy});

  final bool showUIForPrivacyPolicy;

  @override
  State<TermsAndPrivacyScreenContent> createState() =>
      _TermsAndPrivacyScreenContentState();
}

class _TermsAndPrivacyScreenContentState
    extends State<TermsAndPrivacyScreenContent> {

  TextEditingController termsAndPrivacyController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.showUIForPrivacyPolicy) {
      termsAndPrivacyController.text = privacyPolicy;
    } else {
      termsAndPrivacyController.text = termsAndCondition;
    }
  }

  showSuccessfulDialog() {
    showDialog(context: context, builder: (BuildContext context) => SuccessfulDialog(
        title: "Success!",
        description: "Successful! updated the "
            "${widget.showUIForPrivacyPolicy ? "Privacy Policy" : "Terms & Condition"} ",
        buttonText: "Okay"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                    Text(widget.showUIForPrivacyPolicy ? "Privacy Policy"
                        : "Terms & Conditions", style: const TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    ),),

                    const SizedBox(height: 4,),

                    Text(widget.showUIForPrivacyPolicy
                        ? "You can change privacy policy from here"
                        : "You can change Terms & Condition from here",
                      style: const TextStyle(color: grey, fontSize: 11),),

                    const SizedBox(height: appPadding * 2,),

                    SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height - 330,
                        child: TextFormField(
                          minLines: 50,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          controller: termsAndPrivacyController,

                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: adminPanelPrimaryColor
                              )
                            ),

                            labelText: widget.showUIForPrivacyPolicy ?
                                "Privacy Policy" : "Terms & Conditions"
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: appPadding * 2,)
                  ],
                ),
              ),

              GestureDetector(
                onTap: () {
                  showSuccessfulDialog();
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: appPadding / 2,
                    bottom: appPadding / 2
                  ),

                  margin: const EdgeInsets.all(appPadding),
                  decoration: BoxDecoration(
                    color: blueThemeColor,
                    borderRadius: BorderRadius.circular(24)
                  ),

                  child: Center(
                    child: Text("Submit", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: whiteColor
                    ),),
                  ),
                ),
              )
            ],
        ));
  }
}
