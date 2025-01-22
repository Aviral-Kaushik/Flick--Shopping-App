import 'package:flick/data/database/hive_boxes.dart';
import 'package:flick/models/User.dart';
import 'package:flick/models/order_product.dart';
import 'package:hive/hive.dart';

class HiveBoxHelperClass {

  Future<void> openUserBox() async {
    await Hive.openBox<User>(HiveBoxes.userBox);
  }

  Future<void> openCartBox() async {
    await Hive.openBox<OrderProduct>(HiveBoxes.cartBox);
  }

  Future<void> openAllBoxes() async {
    await openUserBox();
    await openCartBox();
  }

}