import 'package:flick/components/checkout_bottom_card.dart';
import 'package:flick/core/models/cart_item.dart';
import 'package:flick/components/order_summary_card.dart';
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

  @override
  void initState() {
    super.initState();
  }

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
                            OrderProduct orderProduct = OrderProduct.fromProduct(value.getCartItems()[index], 1);

                            // return the cart item
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: appPadding / 2),
                              child: OrderSummaryCard(
                                orderProduct: orderProduct,

                                cartConfigurations: CartConfigurationsForSummaryCard(
                                  textSize: 12,
                                  iconSize: 15,
                                  onIncrementPressed: () {
                                    orderProduct.quantity++;
                                    setState(() {});
                                  },
                                  onDecrementPressed: () {
                                    if (orderProduct.quantity > 1) {
                                      orderProduct.quantity--;
                                      setState(() {});
                                    }
                                  }
                                ),
                              ),
                            );
                          }),
                    ),

                    const SizedBox(height: appPadding),

                  if (value.getCartItems().isNotEmpty)
                    CheckoutBottomCard(
                        checkoutButtonText: "Buy Now!",
                        totalPrice: getTotalPrice(getOrderProductsFromProduct(value.getCartItems())),
                        onCheckoutButtonPressed: () {}
                    )
                ],
              ),
            ));
  }

  String getTotalPrice(List<OrderProduct> orderProducts) {
    double totalPrice = 0;
    for (OrderProduct orderProducts in orderProducts) {
      totalPrice += orderProducts.productPrice * orderProducts.quantity;
    }
    return totalPrice.toStringAsFixed(2);
  }

  // TODO This must be removed when Cart implemented with Hive DB.
  List<OrderProduct> getOrderProductsFromProduct(List<Product> products) {
    List<OrderProduct> orderProducts = [];

    for (Product product in products) {
      orderProducts.add(OrderProduct.fromProduct(product, 1));
    }

    return orderProducts;
  }
}
