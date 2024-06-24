import 'package:flick/admin_panel/blocs/referrals/referrals_bloc.dart';
import 'package:flick/admin_panel/blocs/referrals/referrals_event.dart';
import 'package:flick/admin_panel/blocs/referrals/referrals_state.dart';
import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/components/widgets/DetailsChipCard.dart';
import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/admin_panel/models/ReferralInfoModel.dart';
import 'package:flick/helper/DialogHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReferralsScreenContent extends StatefulWidget {
  const ReferralsScreenContent({super.key});

  @override
  State<ReferralsScreenContent> createState() => _ReferralsScreenContentState();
}

class _ReferralsScreenContentState extends State<ReferralsScreenContent> {

  final ReferralsBloc referralsBloc = locator.get<ReferralsBloc>();

  late DialogHelper dialogHelper;
  List<ReferralInfoModel>? referralInfoModels;

  var referralMessageController = TextEditingController();

  late String referralMessage;
  bool isAnyDialogShowing = false;

  @override
  void initState() {
    super.initState();

    dialogHelper = DialogHelper(context);

    referralsBloc.add(const FetchReferralMessageAndData());

    referralMessage = "";
  }

  showProgressDialog(String message) {
    isAnyDialogShowing = true;
    dialogHelper.showProgressDialog(message, () {
      isAnyDialogShowing = false;
    });
  }

  showErrorDialog(String errorMessage) {
    isAnyDialogShowing = true;
    dialogHelper.showSuccessfulOrErrorDialog(
        "OopsQ", errorMessage, "Dismiss", true, () {
      isAnyDialogShowing = false;
    });
  }


  showSuccessfulDialog(String message) {
    isAnyDialogShowing = true;
    dialogHelper.showSuccessfulOrErrorDialog("Success", message, "Okay",
        false, () {
          isAnyDialogShowing = false;
        });
  }

  dismissAllDialog() {
    if (isAnyDialogShowing) {
      isAnyDialogShowing = false;
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    referralMessageController.text = referralMessage;
    return BlocProvider<ReferralsBloc>(
      create: (_) => referralsBloc,
      child: BlocListener<ReferralsBloc, ReferralsState>(
        listener: (context, state) {
          if (state is ReferralsLoading) {

            dismissAllDialog();
            showProgressDialog(state.progressMessage);

          }

          if (state is ReferralsDataFetched) {

            referralMessage = state.referralData.referralMessage;
            referralInfoModels = state.referralData.referralInfoModels;

            dismissAllDialog();

            setState(() {});
          }

          if (state is ReferralError) {

            dismissAllDialog();
            showErrorDialog(state.errorMessage);

          }

          if (state is ReferralsMessageUpdatedSuccessfully) {

            dismissAllDialog();
            showSuccessfulDialog("Referral Message Updated Successfully!");

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

                    referralInfoModels != null ?
                    DetailsChipCard(referralData: referralInfoModels)
                        : const SizedBox(height: 0,),

                    const SizedBox(
                      height: appPadding * 3,
                    ),

                    const Text("Referral Message", style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                    )),

                    const SizedBox(height: 4,),

                    const Text("This message will be shared with each referral message with app link",
                    style: TextStyle(
                      color: grey,
                      fontSize: 11
                    ),),

                    const SizedBox(height: appPadding * 2 ,),

                    TextFormField(
                      minLines: 8,
                      maxLines: null,
                      controller: referralMessageController,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: adminPanelPrimaryColor
                          )
                        ),
                        labelText: "Referral Message",
                      ),
                    ),

                    const SizedBox(height: appPadding * 2 ,),

                  ],
                ),
              ),

              GestureDetector(
                onTap: () {
                  if (referralMessageController.text.isEmpty) {
                    return;
                  }

                  referralsBloc.add(UpdateReferralMessage(referralMessageController.text));
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      top: appPadding / 2,
                      bottom: appPadding / 2),

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
            ],
          ),
        ),
      ),
    );
  }
}
