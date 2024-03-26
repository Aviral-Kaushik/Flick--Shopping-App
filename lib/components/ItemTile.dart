import 'package:flick/core/models/ShoppingItem.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final ShoppingItem shoppingItem;

  const ItemTile({super.key, required this.shoppingItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 200,
      decoration: BoxDecoration(
          color: shoppingCardBackground,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Shoe pic
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(shoppingItem.imagePath)),

          // Description
          Text(
            shoppingItem.description,
            style: TextStyle(color: quoteTextColor),
          ),

          // Price + Detail
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Item Name
                    Text(
                      shoppingItem.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    // Price
                    Text(
                      "\$ ${shoppingItem.price}",
                      style: TextStyle(color: subTitleTextColor),
                    )
                  ],
                ),

                // Plus Button
                Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: blackColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12))),
                    child: Icon(
                      Icons.add,
                      color: whiteColor,
                    ))
              ],
            ),
          )

          // Button to add to cart
        ],
      ),
    );
  }
}
