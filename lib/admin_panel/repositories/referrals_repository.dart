import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/admin_panel/models/ReferralInfoModel.dart';
import 'package:flick/admin_panel/models/referrals/ui_related_referral_data.dart';
import 'package:flick/admin_panel/services/firebase_services.dart';
import 'package:flick/utils/Colors.dart';

class ReferralsRepository {

  FirebaseServices firebaseServices;

  ReferralsRepository(this.firebaseServices);

  Future<UIRelatedReferralData> fetchReferralData() async {
    // TODO As in firebase all referral counts and message will be stored in
    // TODO one collection then we need fetch that model only in this function

    return generateUiRelatedReferralDataFromReferralData(
        referralMessageFromFirebase,
        facebookReferralsCountFromFirebase,
        twitterReferralsCountFromFirebase,
        linkedinReferralsCountFromFirebase,
        othersReferralsCountFromFirebase);
  }

  Future<bool> updateReferralMessage(String referralMessage) async {
    referralMessageFromFirebase = referralMessage;
    return true;
  }

  UIRelatedReferralData generateUiRelatedReferralDataFromReferralData(
      String referralMessage,
      int facebookReferralsCount,
      int twitterReferralsCount,
      int linkedinReferralsCount,
      int othersReferralsCount,
      ) {
    List<ReferralInfoModel> referralData = [
      ReferralInfoModel(
        title: "Facebook",
        count: facebookReferralsCount,
        svgSrc: "assets/icons/Facebook.svg",
        color: adminPanelPrimaryColor,
      ),
      ReferralInfoModel(
        title: "Twitter",
        count: twitterReferralsCount,
        svgSrc: "assets/icons/Twitter.svg",
        color: adminPanelPrimaryColor,
      ),
      ReferralInfoModel(
        title: "Linkedin",
        count: linkedinReferralsCount,
        svgSrc: "assets/icons/Linkedin.svg",
        color: adminPanelPrimaryColor,
      ),

      ReferralInfoModel(
        title: "Dribble",
        count: othersReferralsCount,
        svgSrc: "assets/icons/Dribbble.svg",
        color: red,
      ),
    ];

    return UIRelatedReferralData(referralMessage, referralData);
  }
}
