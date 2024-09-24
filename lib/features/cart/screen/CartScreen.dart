import 'package:flick/components/CartItemTile.dart';
import 'package:flick/core/models/CartItem.dart';
import 'package:flick/core/models/ShoppingItem.dart';
import 'package:flick/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  void deleteCartItem(Product product) {
    Provider.of<CartItem>(context, listen: false).removeItemInCart(product);

    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Successfully Delete!"),
          content: Text("Item removed from cart!"),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartItem>(
        builder: (context, value, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // heading
                  const Text(
                    "My Cart",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  ),

                  const SizedBox(
                    height: 10.0,
                  ),

                  Expanded(
                    child: ListView.builder(
                        itemCount: value.getCartItems().length,
                        itemBuilder: (context, index) {
                          // get individual shoe
                          Product product = value.getCartItems()[index];

                          // return the cart item
                          return CartItemTile(
                              product: product,
                              onDeletePressed: () => deleteCartItem(product));
                        }),
                  )
                ],
              ),
            ));
  }
}
