import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flick/data/database/hive_service.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteProductCard extends StatefulWidget {
  const FavouriteProductCard({
    super.key,
    required this.product,
    required this.hiveService,
    required this.onAddToCartPressed,
    required this.onDeleteButtonPressed,
  });

  final Product product;
  final HiveService hiveService;
  final Function() onAddToCartPressed;
  final Function() onDeleteButtonPressed;

  @override
  State<FavouriteProductCard> createState() => _FavouriteProductCardState();
}

class _FavouriteProductCardState extends State<FavouriteProductCard> {

  bool isProductInCart = false;

  void checkIfProductIsInCart() async {
    isProductInCart = await widget.hiveService.isInCart(widget.product.id);
    setState(() {});
  }

  Widget boldAndSimpleRowTextWidget(String boldText, String simpleText) {
    return Text.rich(
      TextSpan(
        children: [

          TextSpan(
            text: boldText,
            style: GoogleFonts.lato(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,),
          ),

          TextSpan(
            text: simpleText,
            style: GoogleFonts.lato(
                color: textColor,
                fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget deleteIconWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(50),
      ),

      child: GestureDetector(
        onTap: () {
          widget.onDeleteButtonPressed();
        },
        child: Padding(
          padding: const EdgeInsets.all(appPadding / 2),
          child: Icon(
            Icons.delete,
            color: whiteColor,
            size: 20,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkIfProductIsInCart();
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding / 2),
      child: Stack(
          children: [
            Container(

              padding: const EdgeInsets.all(appPadding),

              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1.5,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),

                        child: Image.asset(widget.product.productImages[0],
                            width: 100, height: 100, fit: BoxFit.cover),
                      ),

                      const SizedBox(width: appPadding),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          SizedBox(
                            width: (width / 2) - 30,
                            child: Text(widget.product.productName,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: GoogleFonts.lato(
                                    color: textColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ),

                          const SizedBox(height: appPadding / 2),

                          Text("by ${widget.product.sellerName}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.lato(
                                  color: Colors.grey,
                                  fontSize: 12)),

                          const SizedBox(height: appPadding / 2),

                          RatingBar.readOnly(
                            filledIcon: Icons.star,
                            emptyIcon: Icons.star_border,
                            initialRating: widget.product.productRating,
                            maxRating: 5,
                            isHalfAllowed: true,
                            size: 18,
                            halfFilledIcon: Icons.star_half,
                          ),

                          const SizedBox(height: appPadding / 2),

                          Text("Only ${widget.product.stock} left in stock",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: GoogleFonts.lato(
                                  color: Colors.redAccent,
                                  fontSize: 12)),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: appPadding,),

                  boldAndSimpleRowTextWidget(
                      "Price: ₹", widget.product.productPrice.toString()),
                ],
              ),
            ),

            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  if (isProductInCart) {
                    return;
                  }
                  widget.onAddToCartPressed();
                },
                child: Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(left: 20.0),
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(12),
                            topLeft: Radius.circular(12))),
                    child: Icon(
                      isProductInCart ? Icons.check : Icons.add,
                      color: whiteColor,
                    )),
              ),
            ),

            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(top: appPadding / 2,
                    right: appPadding / 2),
                child: deleteIconWidget(),
              ),
            ),
          ]
      ),
    );
  }
}
