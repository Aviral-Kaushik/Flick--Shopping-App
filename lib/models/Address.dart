import 'package:cloud_firestore/cloud_firestore.dart';

class Address {
  Address(
      {required this.userId,
      required this.address,
      required this.contactNumber});

  String userId;
  String address;
  String contactNumber;

  factory Address.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return Address(
        userId: data?["user_id"],
        address: data?["address"],
        contactNumber: data?["contactNumber"]);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "user_id": userId,
      "address": address,
      "contact_number": contactNumber,
    };
  }
}
