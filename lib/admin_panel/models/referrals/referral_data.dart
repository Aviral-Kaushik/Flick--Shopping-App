import 'package:cloud_firestore/cloud_firestore.dart';

class ReferralData {
  final String referralMessage;
  final int facebookReferralsCount;
  final int twitterReferralsCount;
  final int linkedinReferralsCount;
  final int otherReferralsCount;

  ReferralData(
      {required this.referralMessage,
      required this.facebookReferralsCount,
      required this.twitterReferralsCount,
      required this.linkedinReferralsCount,
      required this.otherReferralsCount});

  Map<String, dynamic> toFirestore() {
    return {
      "referral_message": referralMessage,
      "facebook_referrals": facebookReferralsCount,
      "twitter_referrals": twitterReferralsCount,
      "linkedin_referrals": linkedinReferralsCount,
      "others_referrals": otherReferralsCount,
    };
  }

  factory ReferralData.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final referralDataMap = snapshot.data();

    return ReferralData(
        referralMessage: referralDataMap?["referral_message"],
        facebookReferralsCount: referralDataMap?["facebook_referrals"],
        twitterReferralsCount: referralDataMap?["twitter_referrals"],
        linkedinReferralsCount: referralDataMap?["linkedin_referrals"],
        otherReferralsCount: referralDataMap?["others_referrals"]);
  }

  static String mapFieldNameToFirebase(String referralName) {

    if (referralName == "facebook") {
      return "facebook_referrals";
    } else if (referralName == "twitter") {
      return "twitter_referrals";
    } else if (referralName == "linkedin") {
      return "linkedin_referrals";
    } else {
      return "others_referrals";
    }
  }
}
