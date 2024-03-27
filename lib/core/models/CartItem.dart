import 'package:flick/core/models/ShoppingItem.dart';
import 'package:flutter/material.dart';

class CartItem extends ChangeNotifier {

  // List of items for sale
  List<ShoppingItem> shoppingItemsWithSale = [
    ShoppingItem(
        name: "Zoom Freak",
        price: "236",
        imagePath: "lib/images/zoom_freak.png",
        description:
            "The forward-thinking design of his latest signature shoe."),
    ShoppingItem(
        name: "Air Jordan",
        price: "220",
        imagePath: "lib/images/air_jordan.png",
        description: "You\'ve got the hops and the speed lace up that enhances."),
    ShoppingItem(
        name: "KD Treys",
        price: "240",
        imagePath: "lib/images/kd_treys.png",
        description: "A secure midfoot strap is suited for scoring binges and defensive"),
    ShoppingItem(
        name: "Kyrie 6",
        price: "190",
        imagePath: "lib/images/kyrie.jpeg",
        description: "Bouncy cushioning is paired with soft yet supportive foam."),
  ];

  // List of items in user cart
  List<ShoppingItem> cartItems = [];

  // getter of list of item on sale
  List<ShoppingItem> getShoppingItemOnSale() {
    return shoppingItemsWithSale;
  }

  // getter of cart
  List<ShoppingItem> getCartItems() {
    return cartItems;
  }

  // add item from cart
  void addItemToCart(ShoppingItem shoppingItem) {
    cartItems.add(shoppingItem);
    notifyListeners();
  }

  // remove item from cart
  void removeItemToCart(ShoppingItem shoppingItem) {
    cartItems.remove(shoppingItem);
    notifyListeners();
  }
}
