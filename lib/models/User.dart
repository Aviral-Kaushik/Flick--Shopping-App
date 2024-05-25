import 'package:flick/models/Address.dart';
import 'package:flick/models/Product.dart';

class User {

  User({
   required this.id,
   required this.username,
   required this.password,
   required this.name,
   required this.device,
   required this.isAdmin,
   required this.joiningDate,
   required this.profilePhoto,
   required this.itemsInCart,
   required this.addresses,
   required this.pastProducts,
   required this.country,
   required this.ratedProduct,
});

  String id;
  String username;
  String password;
  String name;
  String device;
  bool isAdmin;
  String joiningDate;
  String profilePhoto;
  List<Product> itemsInCart;
  List<Address> addresses;
  List<Product> pastProducts;
  String country;
  List<Product> ratedProduct;

}