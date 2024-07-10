import 'package:cloud_firestore/cloud_firestore.dart';

class RulesAndRegulationHelper {

  Map<String, dynamic> generateMapForStoringInFirebase(
      String termsAndPrivacy, bool isPrivacyPolicy) {

    return {
      isPrivacyPolicy ? "Privacy Policy" : "Terms & Conditions": termsAndPrivacy
    };
  }

  String fetchTermsAndPrivacyFromMap(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      bool shouldFetchPrivacyPolicy) {
    final data = snapshot.data();

    if (shouldFetchPrivacyPolicy) {
      return data?["Privacy Policy"];
    }

    return data?["Terms & Conditions"];
  }
}
