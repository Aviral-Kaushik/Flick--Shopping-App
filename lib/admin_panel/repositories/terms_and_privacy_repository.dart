import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/admin_panel/services/firebase_services.dart';

class TermsAndPrivacyRepository {

  FirebaseServices firebaseServices;

  TermsAndPrivacyRepository(this.firebaseServices);


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