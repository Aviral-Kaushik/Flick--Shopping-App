import 'package:flick/components/ItemTile.dart';
import 'package:flick/core/models/ShoppingItem.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // search bar
        _searchBar(),

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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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

        Expanded(
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  ShoppingItem shoppingItem = ShoppingItem(
                      name: "Air Jordan",
                      price: "240",
                      imagePath: "lib/images/air_jordan.png",
                      description: "Cool Shoe");
                  return ItemTile(
                    shoppingItem: shoppingItem,
                  );
                })),

        Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
          child: Divider(color: whiteTextColor,),
        )
      ],
    );
  }

  _searchBar() {
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
        ));
  }
}
