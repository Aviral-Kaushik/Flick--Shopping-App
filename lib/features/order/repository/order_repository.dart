import 'package:flick/models/pre_order.dart';
import 'package:flick/services/firebase_services.dart';

class OrderRepository {

  final FirebaseServices firebaseServices;

  OrderRepository(this.firebaseServices);

  Future<bool> postOrder(PreOrder preOrder) async {
    return true;
  }

}