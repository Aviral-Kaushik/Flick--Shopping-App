import 'package:flick/components/checkout_bottom_card.dart';
import 'package:flick/components/order_summary_card.dart';
import 'package:flick/data/database/hive_service.dart';
import 'package:flick/helper/DialogHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/User.dart';
import 'package:flick/models/order_product.dart';
import 'package:flick/models/pre_order.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  HiveService hiveService = locator.get<HiveService>();
  late DialogHelper dialogHelper;

  List<OrderProduct> cartProducts = [];

  User? user;

  @override
  void initState() {
    super.initState();
    dialogHelper = DialogHelper(context);

    loadUserData();

    getAllProductsInTheCart();
  }

  /// Next Tasks:
  /// The Screen should be updated when the screen is revisited after pop Order Success Screen.
  /// Improve 'Successfully added to cart' dialog UI
  /// We can also show something like already in cart and block add to cart button on Home Screen and Product Screen

  void loadUserData() async {
    user = await User.instance;
  }

  void getAllProductsInTheCart() {
    cartProducts = hiveService.gatAllCartProducts();
    setState(() {});
  }

  Future<void> updateOrderProductInDB(OrderProduct orderProduct) async {
    await hiveService.addProductToCart(orderProduct);
  }

  void deleteCartItem(String productId) async {
    await hiveService.removeItemFromTheCart(productId);

    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text("Successfully Delete!"),
              content: Text("Item removed from cart!"),
            ));

    getAllProductsInTheCart();
  }

  void showLoginWarningDialog(Function() onLoginButtonPressed) {
    dialogHelper.showWarningDialog("Please! Login to Continue", "Login",
        "Cancel", onLoginButtonPressed, Colors.blueAccent, () {});
  }

  int getTotalPrice() {
    int totalPrice = 0;
    for (OrderProduct orderProducts in cartProducts) {
      totalPrice += orderProducts.productPrice * orderProducts.quantity;
    }
    return totalPrice;
  }

  PreOrder getPreOrder() {
    return PreOrder(
      orderProducts: cartProducts,
      totalPriceAtCheckout: getTotalPrice(),
      isFromCart: true
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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

              if (cartProducts.isEmpty)
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
                      itemCount: cartProducts.length,
                      itemBuilder: (context, index) {
                        OrderProduct orderProduct = cartProducts[index];

                        // return the cart item
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: appPadding / 2),
                          child: OrderSummaryCard(
                            orderProduct: orderProduct,

                            cartConfigurations: CartConfigurationsForSummaryCard(
                              textSize: 12,
                              iconSize: 15,
                              onIncrementPressed: () async {
                                orderProduct.quantity++;
                                await updateOrderProductInDB(orderProduct);
                                setState(() {});
                              },
                              onDecrementPressed: () async {
                                if (orderProduct.quantity > 1) {
                                  orderProduct.quantity--;
                                  await updateOrderProductInDB(orderProduct);
                                  setState(() {});
                                }
                              }
                            ),
                            onRemovePressed: () {
                              deleteCartItem(orderProduct.id);
                            },
                          ),
                        );
                      }),
                ),

                const SizedBox(height: appPadding),

              if (cartProducts.isNotEmpty)
                CheckoutBottomCard(
                    checkoutButtonText: "Buy Now!",
                    totalPrice: getTotalPrice().toString(),
                    onCheckoutButtonPressed: () {
                      if (user != null && user!.id.isNotEmpty) {
                        Navigator.pushNamed(context, "/addressesScreen",
                            arguments: {
                              'showUIForSelectAddressScreen': true,
                              'preOrder': getPreOrder()
                            }
                        );
                      } else {
                        showLoginWarningDialog(() {
                          Navigator.pushNamed(
                              context,
                              "/loginScreen"
                          );
                        });
                      }
                    }
                )
            ],
          ),
        );
  }

}
