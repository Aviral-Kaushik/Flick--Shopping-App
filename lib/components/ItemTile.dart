import 'package:flick/models/Product.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final void Function()? onProductTilePressed;
  final void Function()? onAddToCartButtonPressed;

  const ProductTile(
      {super.key,
      required this.product,
      required this.onProductTilePressed,
      this.onAddToCartButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: onProductTilePressed,
        child: Container(
          margin: const EdgeInsets.only(left: 25),
          width: 200,
          decoration: BoxDecoration(
              color: shoppingCardBackground,
              borderRadius: BorderRadius.circular(12)),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Shoe pic
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      product.productImages[0],
                      width: 150,
                      height: 150,
                    )),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        product.productDescription,
                        style: TextStyle(color: quoteTextColor),
                      ),
                    ),

                    // Price + Detail
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Item Name
                              Text(
                                product.productName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),

                              const SizedBox(
                                height: 5,
                              ),
                              // Price
                              Text(
                                "\$ ${product.productPrice}",
                                style: TextStyle(color: subTitleTextColor),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      Positioned(
        bottom: 0,
        right: 0,
        child: GestureDetector(
          onTap: onAddToCartButtonPressed,
          child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      topLeft: Radius.circular(12))),
              child: Icon(
                Icons.add,
                color: whiteColor,
              )),
        ),
      )
    ]);
  }
}
