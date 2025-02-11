import 'package:flick/components/ItemTile.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';

class ProductsListViewWidget extends StatelessWidget {
  const ProductsListViewWidget({super.key,
    required this.context,
    required this.title,
    required this.products,
    required this.addShoppingItemToCart});

  final BuildContext context;
  final String title;
  final List<Product> products;
  final Function(Product) addShoppingItemToCart;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: height * 0.6,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
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
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {

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
      ),
    );
  }
}
