import 'package:cloud_firestore/cloud_firestore.dart';

class Product {

  Product({
    required this.id,
    required this.productName,
    required this.productDescription,
    required this.productImages,
    required this.productRating,
    required this.productPrice,
    required this.totalPurchases,
    required this.stock,
    required this.sellerName,
    required this.productFeatures,
    required this.productCategory,
    required this.availableColors
});

  String id;
  String productName;
  String productDescription;
  List<String> productImages;
  double productRating;
  int productPrice;
  int totalPurchases;
  int stock;
  String sellerName;
  List<String> productFeatures;
  String productCategory;
  List<String> availableColors;


  factory Product.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Product(
      id: data?["product_id"],
        productName: data?["product_name"],
        productDescription: data?["product_description"],
        productImages: data?['product_images'] is Iterable
            ? List.from(data?['product_images'])
            : List.empty(),
        productRating: data?["product_rating"],
        productPrice: data?["product_price"],
        totalPurchases: data?["total_purchases"],
        stock: data?["stock"],
        sellerName: data?["seller_name"],
        productFeatures: data?["product_features"] is Iterable
            ? List.from(data?["product_features"])
            : List.empty(),
        productCategory: data?["product_category"],
        availableColors: data?["available_colors"] is Iterable
            ? List.from(data?["available_colors"])
            : List.empty());
  }

  Map<String, dynamic> toFirestore() {
    return {
      "product_id": id,
      "product_name": productName,
      "product_description": productDescription,
      "product_images": productImages,
      "product_rating": productRating,
      "product_price": productPrice,
      "total_purchases": totalPurchases,
      "stock": stock,
      "seller_name": sellerName,
      "product_features": productFeatures,
      "product_category": productCategory,
      "available_colors": availableColors,
    };
  }

}