import 'package:flick/admin_panel/helper/user_product_filter.dart';
import 'package:flick/services/firebase_services.dart';
import 'package:flick/models/Product.dart';
import 'package:tuple/tuple.dart';

class ProductsRepository {

  late List<Product> products;

  FirebaseServices firebaseServices;

  ProductsRepository(this.firebaseServices);

  Future<Tuple3<List<Product>, bool, String>> fetchAllProduct() async {
    bool isErrorOccurred = false;
    String errorMessage = "";

    products = await firebaseServices.fetchAllProducts();

    return Tuple3(products, isErrorOccurred, errorMessage);
  }

  Future<List<Product>> searchProduct(String query) async {
    if (query == "" || query.isEmpty) {
      return products;
    }

    RegExp regexp = RegExp(query, caseSensitive: false);

    List<Product> filteredProducts = products
        .where((product) =>
            regexp.hasMatch(product.productName) ||
            regexp.hasMatch(product.productDescription) ||
            regexp.hasMatch(product.productPrice.toString()) ||
            regexp.hasMatch(product.productRating.toString()) ||
            regexp.hasMatch(product.sellerName.toString()))
        .toSet()
        .toList();

    return filteredProducts;
  }

  Future<Tuple2<bool, String>> editProduct(Product product) async {
    bool isProductUpdatedSuccessfully = false;
    String errorMessage = "";

    if (!products.contains(product)) {
      isProductUpdatedSuccessfully = false;
      errorMessage = "Product not exists";

      return Tuple2(isProductUpdatedSuccessfully, errorMessage);
    }

    products[products.indexWhere((element) => element.id == product.id)] = product;
    isProductUpdatedSuccessfully = true;

    return Tuple2(isProductUpdatedSuccessfully, errorMessage);
  }

  Future<Tuple2<bool, String>> deleteProduct(Product product) async {
    bool isProductDeletedSuccessfully = false;
    String errorMessage = "";

    if (!products.contains(product)) {
      isProductDeletedSuccessfully = false;
      errorMessage = "Product doesn't exists";

      return Tuple2(isProductDeletedSuccessfully, errorMessage);
    }

    if (products.remove(product)) {
      isProductDeletedSuccessfully = true;
    } else {
      errorMessage = "Cannot remove product";
    }

    return Tuple2(isProductDeletedSuccessfully, errorMessage);
  }

  Future<List<Product>> applyProductsFilter(UserProductFilter productFilter) async {
    return products;
  }

}