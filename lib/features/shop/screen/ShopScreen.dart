import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/components/ItemTile.dart';
import 'package:flick/data/database/hive_service.dart';
import 'package:flick/helper/SnackbarHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/models/order_product.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

  final HiveService hiveService = locator.get<HiveService>();
  final SnackBarHelper snackBarHelper = SnackBarHelper();

  final products = getDummyProducts();

  void addShoppingItemToCart(Product product) async {

    await hiveService.addProductToCart(
        OrderProduct.fromProduct(product, 1));

    snackBarHelper.showSnackBar(context, "Added to cart!");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            // search bar
            Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: searchBarBackgroundColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.search),
                    Text(
                      "Search",
                      style: TextStyle(color: subTitleTextColor),
                    ),
                  ],
                )),

            // message
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(
                "everyone flies... some fly longer than others",
                style: TextStyle(color: quoteTextColor),
              ),
            ),

            // hot picks
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Hot Picks 🔥",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: linkTextColor),
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // list of shoes for sale
            Expanded(
                child: ListView.builder(
                    // itemCount: value.getShoppingItemOnSale().length,
                    itemCount: products.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      // ShoppingItem shoppingItem =
                      //     value.getShoppingItemOnSale()[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: ProductTile(
                          product: products[index],
                          onProductTilePressed: () => Navigator.pushNamed(
                              context, "/productScreen",
                              arguments: products[index]),
                          onAddToCartButtonPressed: () =>
                              addShoppingItemToCart(products[index]),
                          isLastTile: index == products.length - 1,
                        ),
                      );
                    })),


            Padding(
              padding:
                  const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
              child: Divider(
                color: whiteTextColor,
              ),
            )
          ],
        );
  }
}
