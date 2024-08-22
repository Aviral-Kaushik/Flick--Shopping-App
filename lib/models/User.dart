import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

part 'User.g.dart';

@HiveType(typeId: 0)
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

  @HiveField(0)
  String id;
  @HiveField(1)
  String username;
  @HiveField(2)
  String password;
  @HiveField(3)
  String email;
  @HiveField(4)
  String name;
  @HiveField(5)
  String device;
  @HiveField(6)
  bool isAdmin;
  @HiveField(7)
  String joiningDate;
  @HiveField(8)
  String profilePhoto;
  @HiveField(9)
  String country;
  // List<Product> itemsInCart;
  // List<Address> addresses;
  // List<Product> pastProducts;
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