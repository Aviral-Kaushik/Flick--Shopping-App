import 'package:flick/models/Product.dart';
import 'package:tuple/tuple.dart';

class ProductsRepository {

  Future<Tuple3<List<Product>, bool, String>> fetchAllProduct() async {
    return Tuple3(List.empty(), false, "");
  }

  Future<List<Product>> searchProduct(String query) async {
    return List.empty();
  }

  Future<Tuple2<bool, String>> editProduct(Product product) async {
    return const Tuple2(true, "");
  }

  Future<Tuple2<bool, String>> deleteProduct(Product product) async {
    return const Tuple2(false, "Firebase Exception");
  }

}