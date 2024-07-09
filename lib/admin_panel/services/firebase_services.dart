import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {

  var db;

  FirebaseServices() {
    db = FirebaseFirestore.instance;
  }
}