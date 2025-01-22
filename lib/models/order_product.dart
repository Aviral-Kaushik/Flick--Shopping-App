import 'package:flick/models/Product.dart';
import 'package:hive/hive.dart';

part 'order_product.g.dart';

@HiveType(typeId: 2)
class OrderProduct extends Product {

  @HiveField(11)
  int quantity;

  OrderProduct({
      required super.id,
      required super.productName,
      required super.productDescription,
      required super.productImages,
      required super.productRating,
      required super.productPrice,
      required super.totalPurchases,
      required super.stock,
      required super.sellerName,
      required super.productCategory,
      required super.availableColors,
      required this.quantity,
  });

  factory OrderProduct.fromProduct(Product product, int quantity) {
    return OrderProduct(
      id: product.id,
      productName: product.productName,
      productDescription: product.productDescription,
      productImages: product.productImages,
      productRating: product.productRating,
      productPrice: product.productPrice,
      totalPurchases: product.totalPurchases,
      stock: product.stock,
      sellerName: product.sellerName,
      productCategory: product.productCategory,
      availableColors: product.availableColors,
      quantity: quantity,
    );
  }
}