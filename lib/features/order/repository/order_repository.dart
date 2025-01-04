import 'package:flick/models/order.dart';
import 'package:flick/models/order_product.dart';
import 'package:flick/models/pre_order.dart';
import 'package:flick/services/firebase_services.dart';

class OrderRepository {

  final FirebaseServices firebaseServices;

  OrderRepository(this.firebaseServices);

  Future<bool> postOrder(PreOrder preOrder) async {
    bool isOrderCreatedSuccessfully =
    await firebaseServices.createOrder(getOrder(preOrder));
    return isOrderCreatedSuccessfully;
  }

  Order getOrder(PreOrder preOrder) {
    return Order(
      productIds: getAllProductsIds(preOrder.orderProducts),
      quantity: getOrderProductQuantity(preOrder.orderProducts),
      totalPriceAtCheckout: preOrder.totalPriceAtCheckout,
      address: preOrder.address!.address,
      orderedAt: DateTime.now().toString()
    );
  }

  int getOrderProductQuantity(List<OrderProduct> orderProducts) {
   int quantity = 0;
    for (var element in orderProducts) {
      quantity += element.quantity;
    }
   return quantity;
  }

  List<String> getAllProductsIds(List<OrderProduct> orderProducts) {
    List<String> productIds = [];
    for (var element in orderProducts) {
      productIds.add(element.id);
    }
    return productIds;
  }

}