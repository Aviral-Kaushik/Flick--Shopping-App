import 'package:flick/components/checkout_bottom_card.dart';
import 'package:flick/core/models/cart_item.dart';
import 'package:flick/features/order/components/order_summary_card.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/models/order_product.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

                  if (value.getCartItems().isEmpty)
                    Expanded(
                      child: Center(
                        child: Text(
                          "No items in cart!",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                          itemCount: value.getCartItems().length,
                          itemBuilder: (context, index) {
                            // get individual shoe
                            OrderProduct orderProduct = OrderProduct.fromProduct(value.getCartItems()[index], 1);

                            // return the cart item
                            return OrderSummaryCard(
                              orderProduct: orderProduct,
                            );
                          }),
                    ),

                    const SizedBox(height: appPadding * 2),

                  if (value.getCartItems().isNotEmpty)
                    CheckoutBottomCard(
                        checkoutButtonText: "Buy Now!",
                        totalPrice: getTotalPrice(value.getCartItems()),
                        onCheckoutButtonPressed: () {})
                ],
              ),
            ));
  }

  String getTotalPrice(List<Product> products) {
    double totalPrice = 0;
    for (Product product in products) {
      totalPrice += product.productPrice;
    }
    return totalPrice.toStringAsFixed(2);
  }
}
