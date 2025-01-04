import 'package:flick/models/Address.dart';
import 'package:flick/models/order_product.dart';

class PreOrder {

  final List<OrderProduct> orderProducts;
  final int totalPriceAtCheckout;
  Address? address;
  String userName;

  PreOrder({
    required this.orderProducts,
    required this.totalPriceAtCheckout,
    this.address,
    this.userName = "",
  });
}