import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flick/admin_panel/utils/firebase/collections.dart';
import 'package:flick/models/Message.dart';
import 'package:tuple/tuple.dart';

class FirebaseServices {

  var database;

  FirebaseServices() {
    database = FirebaseFirestore.instance;
  }

  Future<Tuple2<bool, String>> storeAllMessagesInFirebase(List<Message> messages) async {
    for (Message message in messages) {
      DocumentReference documentReference = database.collection(messagesCollection).doc();
      message.id = documentReference.id;

      await documentReference.set(message.toFirestore());
      print("Aviral Message added successfully");
    }
    return const Tuple2(false, "");
  }


  Future<List<Message>> getAllMessagesFromFirebase() async {
    List<Message>? messages = [];
    QuerySnapshot snapshot = await database.collection(messagesCollection).withConverter(
      fromFirestore: Message.fromFirestore,
      toFirestore: (Message message, _) => message.toFirestore(),
    ).get();

    // messages = snapshot.docs.map((doc) => Message.fromFirestore(doc.data())).toList();

    return List.empty();
  }

  Future<Tuple2<bool, String>> deleteMessageInFirebase(Message message) async {
    return const Tuple2(false, "");
  }

}