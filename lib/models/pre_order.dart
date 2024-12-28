import 'package:flick/models/order_product.dart';

class PreOrder {

  final List<OrderProduct> orderProducts;
  final int totalPriceAtCheckout;
  String address;

  PreOrder({
    required this.orderProducts,
    required this.totalPriceAtCheckout,
    this.address = ""});
}