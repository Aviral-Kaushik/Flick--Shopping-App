import 'package:flick/models/Product.dart';

class CategoryWiseProducts {

  List<Product> wearableProducts;
  List<Product> sportsProducts;
  List<Product> fitnessProducts;
  List<Product> laptopsProducts;

  CategoryWiseProducts({
    required this.wearableProducts,
    required this.sportsProducts,
    required this.fitnessProducts,
    required this.laptopsProducts,
  });

}