import 'package:cloud_firestore/cloud_firestore.dart';

class RulesAndRegulationHelper {

  Map<String, dynamic> generateMapForStoringInFirebase(
      String termsAndPrivacy, bool isPrivacyPolicy) {

    return {
      isPrivacyPolicy ? "Privacy Policy" : "Terms & Conditions": termsAndPrivacy
    };
  }

  String fetchTermsAndPrivacyFromMap(
      Map<String, dynamic>? snapshot,
      bool shouldFetchPrivacyPolicy) {

    if (shouldFetchPrivacyPolicy) {
      return snapshot?["Privacy Policy"];
    }

    return snapshot?["Terms & Conditions"];
  }
}
