import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flick/admin_panel/helper/RulesAndRegulationHelper.dart';
import 'package:flick/admin_panel/models/referrals/referral_data.dart';
import 'package:flick/admin_panel/utils/firebase/collections.dart';
import 'package:flick/models/Message.dart';
import 'package:flick/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:tuple/tuple.dart';

class FirebaseServices {

  var database;

  FirebaseServices() {
    database = FirebaseFirestore.instance;
  }


  Future<List<Message>> getAllMessagesFromFirebase() async {
    List<Message> messages = [];

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await database.collection(messagesCollection).get();

    messages = snapshot.docs.map((message) {
      return Message.fromFirestore(message);
    }).toList();

    return messages;
  }

  Future<Tuple2<bool, String>> deleteMessageInFirebase(Message message) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    database.collection(messagesCollection).doc(message.id).delete().then(
        (doc) => debugPrint("Document deleted successfully"),
      onError: (e) {
          hasErrorOccurred = true;
          errorMessage = e;
      }
    );

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<String> fetchTermsOrPrivacy(
      bool shouldFetchPrivacyPolicy) async {

    String docName =
    shouldFetchPrivacyPolicy ? "Privacy Policy" : "Terms & Conditions";

    DocumentSnapshot<Map<String, dynamic>> snapshot = await database
        .collection(rulesAndRegulationCollection)
        .doc(docName)
        .get();

    return RulesAndRegulationHelper().fetchTermsAndPrivacyFromMap(
        snapshot.data(), shouldFetchPrivacyPolicy);
  }

  Future<Tuple2<bool, String>> updateTermsOrPrivacy(
      String termsAndPrivacy, bool updatePrivacyPolicy) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    String documentName =
    updatePrivacyPolicy ? "Privacy Policy" : "Terms & Conditions";

    DocumentReference rulesAndRegulationDocumentReference =
    database.collection(rulesAndRegulationCollection).doc(documentName);

    rulesAndRegulationDocumentReference
        .update(RulesAndRegulationHelper().generateMapForStoringInFirebase(
        termsAndPrivacy, updatePrivacyPolicy))
        .then((value) => debugPrint("Rules & Regulation Updated Successfully"),
        onError: (e) {
          hasErrorOccurred = true;
          errorMessage = e;
        });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<ReferralData> fetchReferralData() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await database
        .collection(referralsCollection).doc("Referrals Data").get();

    return ReferralData.fromFirestore(snapshot);
  }

  Future<Tuple2<bool, String>> incrementReferralsCount(String referralType) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    await database
        .collection(referralsCollection)
        .doc("Referrals Data")
        .update({
      ReferralData.mapFieldNameToFirebase(referralType): FieldValue.increment(1)
    }).then((value) => debugPrint("Referral Count Incremented Successfully"),
        onError: (e) {
          hasErrorOccurred = true;
          errorMessage = e;
        });
    ;

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<Tuple2<bool, String>> updateReferralMessage(String referralMessage) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    await database
        .collection(referralsCollection)
        .doc("Referrals Data")
        .update({"referral_message": referralMessage})
        .then((value) => debugPrint("Referral Message Updated Successfully"),
        onError: (e) {
          hasErrorOccurred = true;
          errorMessage = e;
        });;

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<Tuple2<bool, String>> storeAllMessagesInFirebase(List<Message> messages) async {
    for (Message message in messages) {
      DocumentReference documentReference = database.collection(messagesCollection).doc();
      message.id = documentReference.id;

      await documentReference.set(message.toFirestore());
    }
    return const Tuple2(false, "");
  }

  void storeTermsOrPrivacy(
      String termsOrPrivacy, bool storePrivacyPolicy) async {

    DocumentReference rulesAndRegulationDocumentReference = database
        .collection(rulesAndRegulationCollection)
        .doc(storePrivacyPolicy ? "Privacy Policy" : "Terms & Conditions");

    await rulesAndRegulationDocumentReference.set(RulesAndRegulationHelper()
        .generateMapForStoringInFirebase(termsOrPrivacy, storePrivacyPolicy));
  }

  void storeReferralData(ReferralData referralData) async {

    DocumentReference referralsReference =
        database.collection(referralsCollection).doc("Referrals Data");

    await referralsReference.set(referralData.toFirestore());
  }

  void storeAdminsData(List<User> admins) async {

    for (User admin in admins) {
      DocumentReference adminReference = database.collection(adminsCollection).doc();
      admin.id = adminReference.id;
      await adminReference.set(admin.toFirestore());
    }

  }

  Future<List<User>> fetchAllAdmins() async {
    List<User> admins = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await database.collection(adminsCollection).get();

    admins = snapshot.docs.map((admin) {
      return User.fromFirestore(admin);
    }).toList();

    return admins;
  }

  Future<Tuple2<bool, String>> deleteAdmin(User user) async {
    // TODO this is also okay but we need to make is admin to false in users collection to take off admin privileges
    bool hasErrorOccurred = false;
    String errorMessage = "";

    database
        .collection(adminsCollection)
        .doc(user.id)
        .delete()
        .then((doc) => debugPrint("Admin Deleted Successfully"), onError: (e) {
      hasErrorOccurred = true;
      errorMessage = e;
    });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  void createNewAdmin(String email) {
    /**TODO
     * Firstly we need to fetch the user from user collection with this mail, then we have to create admin
     * */
  }

}