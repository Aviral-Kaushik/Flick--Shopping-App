import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flick/admin_panel/helper/RulesAndRegulationHelper.dart';
import 'package:flick/admin_panel/utils/firebase/collections.dart';
import 'package:flick/models/Message.dart';
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

    print("Aviral termsOrPrivacy added successfully");
  }

  Future<String> fetchTermsOrPrivacy(
      bool shouldFetchPrivacyPolicy) async {

    String docName =
        shouldFetchPrivacyPolicy ? "Privacy Policy" : "Terms & Condition";

    QuerySnapshot<Map<String, dynamic>> snapshot = await database
        .collection(rulesAndRegulationCollection)
        .doc(docName)
        .get();

    String termsOrPrivacy = RulesAndRegulationHelper().fetchTermsAndPrivacyFromMap(
        snapshot.docs.first, shouldFetchPrivacyPolicy);

    print("Aviral termsOrPrivacy: $termsOrPrivacy");

    return RulesAndRegulationHelper().fetchTermsAndPrivacyFromMap(
        snapshot.docs.first, shouldFetchPrivacyPolicy);
  }

  Future<Tuple2<bool, String>> updateTermsOrPrivacy(
      String termsAndPrivacy, bool updatePrivacyPolicy) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    String documentName =
        updatePrivacyPolicy ? "Privacy Policy" : "Terms & Condition";

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
}