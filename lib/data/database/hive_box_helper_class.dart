import 'package:flick/models/User.dart';
import 'package:hive/hive.dart';

class HiveBoxHelperClass {

  Future<Box<User>> openUserBox() async {
    return await Hive.openBox<User>('user');
  }

}