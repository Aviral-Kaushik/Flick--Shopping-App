import 'package:carousel_slider/carousel_slider.dart';
import 'package:flick/features/product/widgets/product_header.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product});

  final Product? product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  priceAndColorsRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        // Price Column
        Column(
          children: [
            Text("PRICE: ", style: GoogleFonts.montserrat(
              color: blackColor,
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),),

            Text("\$ ${widget.product?.productPrice}", style: GoogleFonts.raleway(
                color: blackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),),
          ],
        ),

        // Colors Column
        Column(
          children: [
            Text("COLORS: ", style: GoogleFonts.montserrat(
                color: blackColor,
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),),

            // Colors List
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(appPadding * 1.5),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ProductHeader(
                  backButtonPressed: () {
                    Navigator.pop(context);
                  }, favoriteButtonPressed: () {}),

              const SizedBox(height: appPadding * 2,),

              Text(
                "${widget.product?.productName}",
                style: GoogleFonts.raleway(
                    color: blackColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),

              Text(
                "${widget.product?.productCategory}",
                style: GoogleFonts.raleway(
                    color: blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),

              const SizedBox(width: appPadding * 2,),

              if (widget.product != null && widget.product!.productImages.isNotEmpty)
                CarouselSlider(
                  items: widget.product!.productImages.map((e) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(appPadding)
                      ),

                      child:  Image.asset(
                        e,
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                      ),
                    );
                  }).toList(),

                  options: CarouselOptions(
                    height: 300,
                    enableInfiniteScroll:
                      (widget.product!.productImages.length == 1)
                          ? false
                          : true),
                ),

              const SizedBox(height: appPadding * 2,),

              priceAndColorsRowWidget(),
            ],
          ),
        ),
      ),
    );
  }
}