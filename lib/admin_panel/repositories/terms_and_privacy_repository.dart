import 'package:flick/admin_panel/data/Data.dart';

class TermsAndPrivacyRepository {

  Future<String> getTermsAndCondition(bool fetchPrivacyPolicy) async {
    if (fetchPrivacyPolicy) {
      return privacyPolicy;
    }
    return termsAndCondition;
  }

  Future<void> updateTermsOrPolicy(String termsOrPrivacyPolicy,
      bool updatePrivacyPolicy) async {
    if (updatePrivacyPolicy) {
      privacyPolicy = termsOrPrivacyPolicy;
      return;
    }
    termsAndCondition = termsOrPrivacyPolicy;
    return;
  }

}