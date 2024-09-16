import 'package:cloud_firestore/cloud_firestore.dart';

class Address {
  Address(
      {required this.addressId,
      required this.userId,
      required this.address,
      required this.pinCode,
      required this.contactNumber});

  String addressId;
  String userId;
  String address;
  String pinCode;
  String contactNumber;

  factory Address.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return Address(
        addressId: data?["address_id"],
        userId: data?["user_id"],
        address: data?["address"],
        pinCode: data?["pin_code"],
        contactNumber: data?["contactNumber"]);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "address_id": addressId,
      "user_id": userId,
      "address": address,
      "pin_code": pinCode,
      "contact_number": contactNumber,
    };
  }
}
