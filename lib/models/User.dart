import 'package:cloud_firestore/cloud_firestore.dart';

class User {

  User({
   required this.id,
   required this.username,
   required this.password,
   required this.email,
   required this.name,
   required this.device,
   required this.isAdmin,
   required this.joiningDate,
   required this.profilePhoto,
   // required this.itemsInCart,
   // required this.addresses,
   // required this.pastProducts,
   required this.country,
   // required this.ratedProduct,
});

  String id;
  String username;
  String password;
  String email;
  String name;
  String device;
  bool isAdmin;
  String joiningDate;
  String profilePhoto;
  // List<Product> itemsInCart;
  // List<Address> addresses;
  // List<Product> pastProducts;
  String country;
  // List<Product> ratedProduct;

  factory User.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return User(
      id: data?["user_id"],
      username: data?["username"],
      password: data?["password"],
      email: data?["email"],
      name: data?["name"],
      device: data?["device"],
      isAdmin: data?["is_admin"],
      joiningDate: data?["joining_date"],
      profilePhoto: data?["profile_photo"],
      country: data?["country"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "user_id": id,
      "username": username,
      "password": password,
      "email": email,
      "name": name,
      "device": device,
      "is_admin": isAdmin,
      "joining_date": joiningDate,
      "profile_photo": profilePhoto,
      "country": country,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as String,
    username: json['username'] as String,
    password: json['password'] as String,
    email: json['email'] as String,
    name: json['name'] as String,
    device: json['device'] as String,
    isAdmin: json['isAdmin'] as bool,
    joiningDate: json['joiningDate'] as String,
    profilePhoto: json['profilePhoto'] as String,
    country: json['country'] as String,
  );

}