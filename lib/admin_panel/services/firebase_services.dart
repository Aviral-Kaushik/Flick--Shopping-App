import 'package:cloud_firestore/cloud_firestore.dart';
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

}