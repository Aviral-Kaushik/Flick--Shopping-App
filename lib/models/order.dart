class Order {

  String orderId;
  final List<String> productIds;
  final int quantity;
  final int totalPriceAtCheckout;
  final String address;
  final String orderedAt;

  Order({
    this.orderId = "",
    required this.productIds,
    required this.quantity,
    required this.totalPriceAtCheckout,
    required this.address,
    required this.orderedAt
  });
}