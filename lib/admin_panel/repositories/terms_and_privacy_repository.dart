import 'package:flick/services/firebase_services.dart';
import 'package:tuple/tuple.dart';

class TermsAndPrivacyRepository {

  FirebaseServices firebaseServices;

  TermsAndPrivacyRepository(this.firebaseServices);


  Future<String> getTermsAndCondition(bool fetchPrivacyPolicy) async {

    String termsOrPrivacy;

    termsOrPrivacy = await firebaseServices.fetchTermsOrPrivacy(fetchPrivacyPolicy);

    return termsOrPrivacy;
    // if (fetchPrivacyPolicy) {
    //   // firebaseServices.storeTermsOrPrivacy(privacyPolicy, true);
    //   return privacyPolicy;
    // }
    // firebaseServices.storeTermsOrPrivacy(termsAndCondition, false);
  }

  Future<Tuple2<bool, String>> updateTermsOrPolicy(String termsOrPrivacyPolicy,
      bool updatePrivacyPolicy) async {

    Tuple2<bool, String> rulesAndRegulationUpdateResponse = await
        firebaseServices.updateTermsOrPrivacy(termsOrPrivacyPolicy, updatePrivacyPolicy);

    if (rulesAndRegulationUpdateResponse.item1) {
      return rulesAndRegulationUpdateResponse;
    }

    return const Tuple2(false, "");
    // if (updatePrivacyPolicy) {
    //   privacyPolicy = termsOrPrivacyPolicy;
    //   return;
    // }
    // termsAndCondition = termsOrPrivacyPolicy;
    // return;
  }

}