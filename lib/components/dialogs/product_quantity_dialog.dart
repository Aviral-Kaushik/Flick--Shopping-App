import 'package:flick/models/Product.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductQuantityDialog extends StatefulWidget {
  const ProductQuantityDialog(
      {super.key,
      required this.product,
      required this.onBuyNowButtonPressed,});

  final Product product;
  final Function(int quantiity) onBuyNowButtonPressed;

  @override
  State<ProductQuantityDialog> createState() => _ProductQuantityDialogState();
}

class _ProductQuantityDialogState extends State<ProductQuantityDialog> {
  int selectedQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(appPadding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: productQuantityContent(context),
    );
  }

  Widget productQuantityContent(context) {
    return Container(
      padding: const EdgeInsets.all(appPadding),

      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(appPadding),
          shape: BoxShape.rectangle,
          boxShadow: const [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0)
            )
          ]
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          productQuantityHeaderWidget(),

          const SizedBox(
            height: appPadding * 2,
          ),

          quantityButtonAndTextWidget(),

          const SizedBox(
            height: appPadding * 2,
          ),

          cancelAndBuyNowButtonWidget(),
        ],
      ),
    );
  }

  Widget productQuantityHeaderWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text("Confirm Quantity", style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: blackColor,
            fontSize: 17
          ),
        ),

        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              color: blackColor,
              size: 20,
            )
        )
      ],
    );
  }

  Widget quantityButtonAndTextWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        GestureDetector(
          onTap: selectedQuantity > 1
              ? () {
                  selectedQuantity--;
                  setState(() {});
                }
              : null,
          child: Container(
            padding: const EdgeInsets.all(5.0),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selectedQuantity == 1
                  ? Colors.redAccent.withOpacity(0.5)
                  : Colors.redAccent,
            ),

            child: Icon(
              Icons.remove,
              size: 20,
              color: whiteColor,
            ),
          ),
        ),

        const SizedBox(width: 10,),

        Text("$selectedQuantity", style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: blackColor,
            fontSize: 15
          ),
        ),

        const SizedBox(width: 10,),

        GestureDetector(
          onTap: () {
            selectedQuantity++;
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.all(5.0),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blueAccent,
            ),

            child: Icon(
              Icons.add,
              size: 20,
              color: whiteColor,
            ),
          ),
        ),

      ],
    );
  }

  Widget cancelAndBuyNowButtonWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        Expanded(
            child: Center(
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                    padding: const EdgeInsets.only(
                        top: appPadding / 2, bottom: appPadding / 2),

                    decoration: BoxDecoration(
                        color: const Color(0xFFF0F0F0),
                        borderRadius: BorderRadius.circular(appPadding / 2)),

                    child: Center(
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: blackColor,
                            fontSize: 15
                        ),
                      ),
                    )),
              ),
            )
        ),

        const SizedBox(
          width: 8,
        ),

        Expanded(
          child: GestureDetector(
            onTap: () {
              widget.onBuyNowButtonPressed(selectedQuantity);
            },
            child: Container(
                padding: const EdgeInsets.only(
                    top: appPadding / 2, bottom: appPadding / 2),

                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(appPadding / 2)),

                child: Center(
                  child: Text(
                    "Buy Now",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: whiteColor,
                        fontSize: 15
                    ),
                  ),
                )
            ),
          ),
        ),
      ],
    );
  }
}
