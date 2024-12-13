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

    Tuple2<bool, String> updateUserResponse =
    await firebaseServices.updateProduct(product);

    if (!updateUserResponse.item1) {
      products[products.indexWhere((element) => element.id == product.id)] =
          product;
      isProductUpdatedSuccessfully = true;
    }

    return updateUserResponse;
  }

  Future<Tuple2<bool, String>> deleteProduct(Product product) async {
    bool hasErrorOccurred = false;
    String errorMessage = "";

    Tuple2<bool, String> deleteUserResponse =
    await firebaseServices.deleteProduct(product);

    if (deleteUserResponse.item1) {
      hasErrorOccurred = true;
      errorMessage = "Firebase Exception";
    } else {
      hasErrorOccurred = false;
      errorMessage = "";
    }

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<Tuple3<List<Product>, bool, String>> applyProductsFilter(
      UserProductFilter productFilter) async {
    bool errorOccurred = false;
    String errorMessage = "";

    String filterName = productFilter.filterName;
    bool filterUserInAscendingOrder = productFilter.filterInAscendingOrder;

    List<Product> filteredProducts = products;

    if (filterName == "A to Z") {
      filteredProducts.sort((a, b) {
        return a.productName.toLowerCase().compareTo(b.productName.toLowerCase());
      });

      if (!filterUserInAscendingOrder) {
        filteredProducts = filteredProducts.reversed.toList();
      }
    } else if (filterName == "Date Created") {
      // filteredProducts.sort((a, b) {
      //   DateFormat dateFormat = DateFormat('MM-dd-yyyy');
      //
      //   // DateTime dateTime1 = dateFormat.parse(a.joiningDate);
      //   // DateTime dateTime2 = dateFormat.parse(b.joiningDate);
      //
      //   // return dateTime1.compareTo(dateTime2);
      // });

      if (!filterUserInAscendingOrder) {
        filteredProducts = filteredProducts.reversed.toList();
      }
    } else {
      errorOccurred = true;
      errorMessage = "Invalid Filter";
      return Tuple3(filteredProducts, errorOccurred, errorMessage);
    }

    return Tuple3(filteredProducts, errorOccurred, errorMessage);
  }

}