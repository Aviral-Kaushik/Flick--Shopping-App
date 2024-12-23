import 'package:flick/models/Product.dart';

class PreOrder {

  final List<Product> products;
  final int quantity;
  final int totalPriceAtCheckout;
  String address;

  PreOrder({
    required this.products,
    required this.quantity,
    required this.totalPriceAtCheckout,
    this.address = ""});
}