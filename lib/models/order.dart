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

  factory Order.fromFirestore(
      Map<String, dynamic> map) {
    return Order(
        orderId: map["order_id"],
        productIds: map['product_ids'] is Iterable
            ? List.from(map['product_ids'])
            : List.empty(),
        quantity: map["quantity"],
        totalPriceAtCheckout: map["total_price_at_checkout"],
        address: map["address"],
        orderedAt: map["ordered_at"]
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "order_id": orderId,
      "product_ids": productIds,
      "quantity": quantity,
      "total_price_at_checkout": totalPriceAtCheckout,
      "address": address,
      "ordered_at": orderedAt,
    };
  }
}