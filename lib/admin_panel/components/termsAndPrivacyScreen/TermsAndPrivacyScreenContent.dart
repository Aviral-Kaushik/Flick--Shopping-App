import 'package:flick/admin_panel/blocs/termsAndPrivacy/terms_and_privacy_bloc.dart';
import 'package:flick/admin_panel/blocs/termsAndPrivacy/terms_and_privacy_event.dart';
import 'package:flick/admin_panel/blocs/termsAndPrivacy/terms_and_privacy_state.dart';
import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/components/widgets/dialogs/SuccessfulAndErrorDialog.dart';
import 'package:flick/admin_panel/helper/DialogHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  TermsAndPrivacyBloc termsAndPrivacyBloc = locator.get<TermsAndPrivacyBloc>();
  bool isAnyDialogShowing = false;
  late String fetchedTermsOrPolicy;

  @override
  void initState() {
    super.initState();

    termsAndPrivacyBloc.add(FetchTermsOrPrivacyPolicy(widget.showUIForPrivacyPolicy));
  }

  showSuccessfulDialog() {
    isAnyDialogShowing = true;
    showDialog(context: context, builder: (BuildContext context) => SuccessfulAndErrorDialog(
        title: "Success!",
        description: "Successful! updated the "
            "${widget.showUIForPrivacyPolicy ? "Privacy Policy" : "Terms & Condition"} ",
        buttonText: "Okay",
        showUIForErrorDialog: false)).then((value) => {
            isAnyDialogShowing = false
        });
  }

  showErrorDialog(String message) {
    isAnyDialogShowing = true;
    showDialog(context: context, builder: (BuildContext context) => SuccessfulAndErrorDialog(
        title: "Failed",
        description: message,
        buttonText: "Dismiss",
        showUIForErrorDialog: true,
    )).then((value) => {
      isAnyDialogShowing = false
    });
  }

  dismissProgressDialog() => Navigator.pop(context);

  dismissAllDialog() {
    if (isAnyDialogShowing) {
      Navigator.pop(context);
      isAnyDialogShowing = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TermsAndPrivacyBloc>(
        create: (context) => termsAndPrivacyBloc,
        child: BlocListener<TermsAndPrivacyBloc, TermsAndPrivacyState>(
          listener: (context, state) {
            if (state is TermsOrPrivacyPolicyFetched) {

              dismissAllDialog();
              termsAndPrivacyController.text = state.termsAndPrivacy;
              fetchedTermsOrPolicy = state.termsAndPrivacy;
            } else if (state is TermsOrPrivacyPolicyUpdated) {

              dismissAllDialog();
              showSuccessfulDialog();

            } else if (state is TermsOrPrivacyPolicyUpdateFailed) {

              dismissAllDialog();
              showErrorDialog(state.errorMessage);

            } else if (state is TermsAndPrivacyLoading) {

              dismissAllDialog();
              isAnyDialogShowing = true;
              DialogHelper().showProgressDialog(
                  context,
                  "Fetching ${widget.showUIForPrivacyPolicy ?
                  "Privacy Policy" : "Terms & Condition"} ",
                  () => isAnyDialogShowing = false
              );
            }
          },
          child: SafeArea(
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
                              height: MediaQuery.of(context).size.height - 300,
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

                          const SizedBox(height: appPadding,)
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        if (termsAndPrivacyController.text != fetchedTermsOrPolicy) {
                          termsAndPrivacyBloc.add(UpdateTermsOrPrivacyPolicy(
                              termsAndPrivacyController.text,
                              widget.showUIForPrivacyPolicy)
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Please change ${widget.showUIForPrivacyPolicy ?
                            "Privacy Policy" : "Terms & Conditions"} to update'),
                            backgroundColor: blackColor,
                            elevation: 10,
                            behavior: SnackBarBehavior.floating,
                            margin: const EdgeInsets.all(5),
                          ));
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          top: appPadding / 2,
                          bottom: appPadding / 2
                        ),

                        margin: const EdgeInsets.all(appPadding),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
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
                    ),

                    const SizedBox(height: appPadding,)
                  ],
              )
            )
        )
    );
  }
}
