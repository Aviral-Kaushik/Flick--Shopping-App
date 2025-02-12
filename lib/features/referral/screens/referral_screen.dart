import 'package:flick/admin_panel/blocs/referrals/referrals_bloc.dart';
import 'package:flick/admin_panel/blocs/referrals/referrals_event.dart';
import 'package:flick/admin_panel/blocs/referrals/referrals_state.dart';
import 'package:flick/components/small_profile_photo.dart';
import 'package:flick/helper/DialogHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/User.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({super.key});

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {

  ReferralsBloc referralsBloc = locator.get<ReferralsBloc>();

  late final DialogHelper dialogHelper;

  bool isAnyDialogShowing = false;

  String referralMessage = "";

  User? user;

  @override
  initState() {
    super.initState();

    referralsBloc.add(const FetchReferralMessage());

    dialogHelper = DialogHelper(context);

    getUserData();
  }

  Future<void> getUserData() async {
    user = await User.instance;
  }

  Widget referralScreenHeaderWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        SmallProfilePhoto(
            userName: user?.username ?? "A"),

        const SizedBox(width: appPadding,),

        Text("Tell Your Friends", style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: blackColor
        ),)

      ],
    );
  }

  Widget referralScreenTitleAndSubTitleWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Center(
          child: Text(
            "Flick .", style: GoogleFonts.caveat(
              fontSize: 60,
              fontWeight: FontWeight.w800,
              color: blackColor,
              fontStyle: FontStyle.italic
          ),
          ),
        ),

        const SizedBox(height: appPadding / 2,),

        Center(
          child: Text("Just Do It!", style: GoogleFonts.caveat(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: blackColor,
              fontStyle: FontStyle.italic
          ),),
        )

      ],
    );
  }

  Widget referAppsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        shareAppIconWidget("assets/images/referrals_apps/facebook.png",
            () async {

          bool isShareSuccessful = await shareReferralMessageToFacebook();

          if (isShareSuccessful) {
            referralsBloc.add(const IncrementReferralCount("facebook"));
          } else {
            showErrorDialog("Cannot Share Directly to Facebook");
          }
        }),

        shareAppIconWidget("assets/images/referrals_apps/x.png", () async {

          bool isShareSuccessful = await shareReferralMessageToX();

          if (isShareSuccessful) {
            referralsBloc.add(const IncrementReferralCount("twitter"));
          } else {
            showErrorDialog("Cannot Share Directly to X");
          }
        }),

        shareAppIconWidget("assets/images/referrals_apps/linkedin.png",
            () async {

          bool isShareSuccessful = await shareReferralMessageToLinkedIn();

          if (isShareSuccessful) {
            referralsBloc.add(const IncrementReferralCount("linkedin"));
          } else {
            showErrorDialog("Cannot Share Directly to LinkedIn");
          }
        }),

        shareAppIconWidget("assets/images/referrals_apps/others.png", () {
          Share.share(referralMessage);
          referralsBloc.add(const IncrementReferralCount("others"));
        }),
      ],
    );
  }

  Widget orDividerWidget() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: appPadding * 2),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Expanded(
              child: Divider(color: Colors.grey, thickness: 1, height: 100)),

          SizedBox(width: 4,),

          Text("Or", style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),),

          SizedBox(width: 4,),

          Expanded(
              child: Divider(color: Colors.grey, thickness: 1, height: 100)),
        ],
      ),
    );
  }

  Widget copyLinkWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: appPadding, horizontal: appPadding * 3),

            decoration: BoxDecoration(
              color: const Color(0xffFFF8DC).withOpacity(0.5),
              borderRadius: BorderRadius.circular(appPadding),
              // border: Border.all(color: Colors.black, width: 1.0)
            ),
            // color: primaryColor?.withOpacity(0.7),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text(
                  "https://aviralkaushik.epizy.com",
                  style: GoogleFonts.poppins(
                      color: blackColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),


                const SizedBox(
                  height: appPadding,
                ),

                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {

                      await Clipboard.setData(
                        ClipboardData(text: referralMessage));

                      const clipboardSnackBar = SnackBar(
                        content: Text("Link & Message Copied to Clipboard"),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(5),
                      );

                      ScaffoldMessenger.of(context)
                          .showSnackBar(clipboardSnackBar);

                      referralsBloc.add(const IncrementReferralCount("others"));
                  },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: greenButtonColor,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: Text(
                      "Copy Link",
                      style: GoogleFonts.roboto(color: whiteTextColor),
                      // style: TextStyle(color: whiteTextColor),
                    ),
                  ),
                ),

              ],
            ),
          )),
      ],
    );
  }

  Widget shareAppIconWidget(String appIconPath, Function() onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Image.asset(
        appIconPath,
        width: 30,
        height: 30,
      ),
    );
  }

  Future<bool> shareReferralMessageToFacebook() async {
    final facebookUri = Uri.parse(
        "https://www.facebook.com/sharer/sharer.php?u=&quote=${Uri.encodeComponent(referralMessage)}");

    if (await canLaunchUrl(facebookUri)) {
      await launchUrl(facebookUri);
      return true;
    }

    return false;
  }

  Future<bool> shareReferralMessageToX() async {
    final xUri = Uri.parse(
        'https://twitter.com/intent/tweet?text=${Uri.encodeComponent(referralMessage)}');

    if (await canLaunchUrl(xUri)) {
      await launchUrl(xUri);
      return true;
    }
    return false;
  }

  Future<bool> shareReferralMessageToLinkedIn() async {
    final linkedInUri = Uri.parse(
        'https://www.linkedin.com/sharing/share-offsite/?url=${Uri.encodeComponent(referralMessage)}');

    if (await canLaunchUrl(linkedInUri)) {
      await launchUrl(linkedInUri);
      return true;
    }
    return false;
  }

  void showProgressDialog(String message) {
    isAnyDialogShowing = true;
    dialogHelper.showProgressDialog(message, () {
      isAnyDialogShowing = false;
    });
  }

  void showErrorDialog(String message) {
    isAnyDialogShowing = true;
    dialogHelper.showSuccessfulOrErrorDialog(
        "Oops!",
        message,
        "Okay",
        true,
        () {
          isAnyDialogShowing = false;
    });
  }

  void dismissDialog() {
    if (isAnyDialogShowing) {
      Navigator.pop(context);
      isAnyDialogShowing = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReferralsBloc>(
      create: (_) => referralsBloc,
      child: BlocListener<ReferralsBloc, ReferralsState>(
        listener: (context, state) {

          if (state is ReferralsLoading) {
            showProgressDialog(state.progressMessage);
          }

          if (state is ReferralMessageFetched) {
            dismissDialog();
            referralMessage = state.referralMessage;
          }

          if (state is ReferralError) {
            showErrorDialog(state.errorMessage);
          }
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: primaryColor,

            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: appPadding),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  referralScreenHeaderWidget(),

                  const SizedBox(height: appPadding * 2,),

                  referralScreenTitleAndSubTitleWidget(),

                  const SizedBox(height: appPadding * 13,),

                  referAppsWidget(),

                  const SizedBox(height: appPadding,),

                  orDividerWidget(),

                  const SizedBox(height: appPadding,),

                  copyLinkWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
