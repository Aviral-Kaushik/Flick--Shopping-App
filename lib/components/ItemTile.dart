import 'package:flick/data/database/hive_service.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatefulWidget {
  final Product product;
  final void Function()? onProductTilePressed;
  final void Function()? onAddToCartButtonPressed;
  final bool isLastTile;

  const ProductTile(
      {super.key,
      required this.product,
      required this.onProductTilePressed,
      this.onAddToCartButtonPressed,
      required this.isLastTile});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {

  final HiveService _hiveService = locator.get<HiveService>();

  bool isProductInCart = false;

  @override
  void initState() {
    super.initState();

    checkForProductInCart();
  }

  void checkForProductInCart() async {
    isProductInCart = await _hiveService.isInCart(widget.product.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.isLastTile
          ? const EdgeInsets.only(right: appMargin)
          : const EdgeInsets.all(0),
      child: Stack(children: [
        GestureDetector(
          onTap: widget.onProductTilePressed,
          child: Container(
            margin: const EdgeInsets.only(left: appMargin),
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
                        widget.product.productImages[0],
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
                          widget.product.productDescription,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
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
                                  widget.product.productName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                ),

                                const SizedBox(
                                  height: 5,
                                ),
                                // Price
                                Text(
                                  "₹ ${widget.product.productPrice}",
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
            onTap: !isProductInCart ? widget.onAddToCartButtonPressed : null,
            child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                    color: blackColor,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(12),
                        topLeft: Radius.circular(12))),
                child: Icon(
                  isProductInCart ? Icons.check : Icons.add,
                  color: whiteColor,
                )),
          ),
        )
      ]),
    );
  }
}
