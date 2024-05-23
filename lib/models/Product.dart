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
});

  String id;
  String productName;
  String productDescription;
  List<String> productImages;
  int productRating;
  int productPrice;
  int totalPurchases;
  int stock;
  int sellerName;
  List<String> productFeatures;
}