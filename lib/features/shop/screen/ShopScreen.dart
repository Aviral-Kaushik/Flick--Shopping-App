import 'package:flick/components/ItemTile.dart';
import 'package:flick/core/models/CartItem.dart';
import 'package:flick/core/models/ShoppingItem.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  void addShoppingItemToCart(ShoppingItem shoppingItem) {
    Provider.of<CartItem>(context, listen: false).addItemToCart(shoppingItem);

    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text("Successfully Added!"),
              content: Text("Check Your Cart!"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartItem>(
        builder: (context, value, child) => Column(
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
                        itemCount: value.getShoppingItemOnSale().length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          ShoppingItem shoppingItem =
                              value.getShoppingItemOnSale()[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: ItemTile(
                              shoppingItem: shoppingItem,
                              onTap: () => addShoppingItemToCart(shoppingItem),
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
            ));
  }
}
