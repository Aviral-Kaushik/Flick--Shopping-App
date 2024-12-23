class Order {

  String orderId;
  final List<String> productIds;
  final int quantity;
  final int totalPriceAtCheckout;
  String address;

  Order({
    this.orderId = "",
    required this.productIds,
    required this.quantity,
    required this.totalPriceAtCheckout,
    this.address = ""});
}