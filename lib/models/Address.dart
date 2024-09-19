
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
      Map<String, dynamic> map) {
    return Address(
        addressId: map["address_id"],
        userId: map["user_id"],
        address: map["address"],
        pinCode: map["pin_code"],
        contactNumber: map["contactNumber"]);
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
