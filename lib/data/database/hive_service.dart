import 'package:flick/data/database/hive_boxes.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/models/User.dart';
import 'package:flick/models/order_product.dart';
import 'package:hive/hive.dart';

class HiveService {

  Box<User> userBox = Hive.box<User>(HiveBoxes.userBox);
  Box<OrderProduct> cartBox = Hive.box<OrderProduct>(HiveBoxes.cartBox);
  Box<Product> favouritesBox = Hive.box<Product>(HiveBoxes.favouritesBox);

  // User Functions

  void storeUsersData(User user) async {
    userBox.put(user.email, user);
  }

  Future<User?> getUserData(String email) async {
    User? user = userBox.get(email);
    return user;
  }

  void updateUser(User user) async {
    await userBox.put(user.email, user);
  }

  void deleteUserFromLocalDatabase(String email) async {
    await userBox.delete(email);
  }


  // Cart Functions

  // This add function will also work as update function
  Future<void> addProductToCart(OrderProduct orderProduct) async {
    await cartBox.put(orderProduct.id, orderProduct);
  }

  List<OrderProduct> gatAllCartProducts() {
    return cartBox.values.toList();
  }

  Future<void> removeItemFromTheCart(String orderProductId) async {
    await cartBox.delete(orderProductId);
  }

  Future<void> clearCart() async {
    await cartBox.clear();
  }

  Future<bool> isInCart(String productId) async {
    return cartBox.containsKey(productId);
  }

  // Favorites Functions

  Future<void> addProductToFavourites(Product product) async {
    await favouritesBox.put(product.id, product);
  }

  List<Product> getAllFavouritesProducts() {
    return favouritesBox.values.toList();
  }

  Future<void> removeItemFromFavourites(String productId) async {
    await favouritesBox.delete(productId);
  }

  Future<bool> isInFavorites(String productId) async {
    return favouritesBox.containsKey(productId);
  }
}