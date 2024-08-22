import 'package:flick/data/database/hive_box_helper_class.dart';
import 'package:flick/models/User.dart';
import 'package:hive/hive.dart';

class HiveDatabase {

  void storeUsersData(User user) async {
    Box<User> userBox = await HiveBoxHelperClass().openUserBox();
    userBox.put(user.email, user);
    userBox.close();
  }

  Future<User?> getUserData(String email) async {
    Box<User> userBox = await HiveBoxHelperClass().openUserBox();
    User? user = userBox.get(email);
    userBox.close();
    return user;
  }

  void updateUser(User user) async {
    Box<User> userBox = await HiveBoxHelperClass().openUserBox();
    await userBox.put(user.email, user);
    userBox.close();
  }

  void deleteUserFromLocalDatabase(String email) async {
    Box<User> userBox = await HiveBoxHelperClass().openUserBox();
    await userBox.delete(email);
    userBox.close();
  }

}