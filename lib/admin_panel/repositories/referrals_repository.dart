import 'package:flick/admin_panel/converter/converter.dart';
import 'package:flick/admin_panel/models/ReferralInfoModel.dart';
import 'package:flick/admin_panel/models/referrals/referral_data.dart';
import 'package:flick/admin_panel/models/referrals/ui_related_referral_data.dart';
import 'package:flick/admin_panel/services/firebase_services.dart';
import 'package:flick/utils/Colors.dart';
import 'package:tuple/tuple.dart';

class ReferralsRepository {
  FirebaseServices firebaseServices;

  ReferralsRepository(this.firebaseServices);

  Future<UIRelatedReferralData> fetchReferralData() async {
    // TODO As in firebase all referral counts and message will be stored in
    // TODO one collection then we need fetch that model only in this function

    ReferralData referralData = await firebaseServices.fetchReferralData();

    return Converter.convertReferralDataToUiRelatedReferralData(referralData);
    // firebaseServices.storeReferralData(ReferralData(
    //     referralMessage: referralMessageFromFirebase,
    //     facebookReferralsCount: facebookReferralsCountFromFirebase,
    //     twitterReferralsCount: twitterReferralsCountFromFirebase,
    //     linkedinReferralsCount: linkedinReferralsCountFromFirebase,
    //     otherReferralsCount: othersReferralsCountFromFirebase));
  }

  Future<Tuple2<bool, String>> updateReferralMessage(
      String referralMessage) async {
    Tuple2<bool, String> referralMessageUpdateResponse =
        await firebaseServices.updateReferralMessage(referralMessage);

    return referralMessageUpdateResponse;
  }

}
