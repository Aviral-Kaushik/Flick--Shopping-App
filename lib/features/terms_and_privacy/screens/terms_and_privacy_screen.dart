import 'package:flick/admin_panel/blocs/termsAndPrivacy/terms_and_privacy_bloc.dart';
import 'package:flick/admin_panel/blocs/termsAndPrivacy/terms_and_privacy_event.dart';
import 'package:flick/admin_panel/blocs/termsAndPrivacy/terms_and_privacy_state.dart';
import 'package:flick/components/UserAppBar.dart';
import 'package:flick/components/UserAppDrawer.dart';
import 'package:flick/helper/DialogHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TermsAndPrivacyScreen extends StatefulWidget {
  const TermsAndPrivacyScreen({super.key, this.showUiForPrivacyPolicy});

  final bool? showUiForPrivacyPolicy;

  @override
  State<TermsAndPrivacyScreen> createState() => _TermsAndPrivacyScreenState();
}

class _TermsAndPrivacyScreenState extends State<TermsAndPrivacyScreen> {
  TermsAndPrivacyBloc termsAndPrivacyBloc = locator.get<TermsAndPrivacyBloc>();

  late DialogHelper dialogHelper;

  String termsOrPrivacy = "";
  bool isProgressDialogShowing = false;

  @override
  void initState() {
    super.initState();

    dialogHelper = DialogHelper(context);

    termsAndPrivacyBloc.add(FetchTermsOrPrivacyPolicy(
        widget.showUiForPrivacyPolicy != null
            ? widget.showUiForPrivacyPolicy!
            : false));
  }

  String getLastUpdatedDate() {
    return DateFormat.yMMMEd()
        .format(DateTime.now().subtract(const Duration(days: 1)))
        .toString();
  }

  String getHeadingText() {
    if (widget.showUiForPrivacyPolicy != null &&
        widget.showUiForPrivacyPolicy!) {
      return "Privacy Policy";
    }

    return "Terms & Conditions";
  }

  showProgressDialog(String message) {
    isProgressDialogShowing = true;
    dialogHelper.showProgressDialog(message, () {
      isProgressDialogShowing = false;
    });
  }

  dismissProgressDialog() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TermsAndPrivacyBloc>(
      create: (_) => termsAndPrivacyBloc,
      child: BlocListener<TermsAndPrivacyBloc, TermsAndPrivacyState>(
        listener: (context, state) {
          if (state is TermsAndPrivacyLoading) {
            showProgressDialog(
                "Fetching ${widget.showUiForPrivacyPolicy != null && widget.showUiForPrivacyPolicy! ? "Privacy Policy" : "Terms & Conditions"}! Please Wait");
          }

          if (state is TermsOrPrivacyPolicyFetched) {
            if (isProgressDialogShowing) {
              dismissProgressDialog();
            }
            termsOrPrivacy = state.termsAndPrivacy;
            setState(() {});
          }
        },
        child: Scaffold(
          appBar: const UserAppBar(),
          drawer: const UserAppDrawer(),
          backgroundColor: primaryColor,
          body: SafeArea(
            child: SingleChildScrollView(

              child: Container(
                padding: const EdgeInsets.only(
                    left: 20,
                    right: appPadding,
                    top: appPadding,
                    bottom: appPadding),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      getHeadingText(),
                      style: const TextStyle(
                          color: textColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: appPadding / 2,),

                    Text(
                      "Last Updated: ${getLastUpdatedDate()}",
                      style: const TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),
                    ),

                    const SizedBox(height: appPadding * 2,),

                    Text(
                      termsOrPrivacy,
                      style: const TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
