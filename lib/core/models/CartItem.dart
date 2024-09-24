import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/models/Product.dart';
import 'package:flutter/material.dart';

class CartItem extends ChangeNotifier {

  // List of items for sale
  List<Product> shoppingItemsWithSale = getDummyProducts();

  // List of items in user cart
  List<Product> cartProducts = [];

  // getter of list of item on sale
  List<Product> getShoppingItemOnSale() {
    return shoppingItemsWithSale;
  }

  // getter of cart
  List<Product> getCartItems() {
    return cartProducts;
  }

  // add item from cart
  void addItemToCart(Product product) {
    cartProducts.add(product);
    notifyListeners();
  }

  // remove item from cart
  void removeItemInCart(Product product) {
    cartProducts.remove(product);
    notifyListeners();
  }
}
