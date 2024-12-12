import 'package:flick/models/Product.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleProductListLayout extends StatefulWidget {
  const SingleProductListLayout({super.key, required this.product});

  final Product product;

  @override
  State<SingleProductListLayout> createState() => _SingleProductListLayoutState();
}

class _SingleProductListLayoutState extends State<SingleProductListLayout> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: appPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // ClipRRect(
              //     borderRadius: BorderRadius.circular(30),
              //     child: Image.network(
              //       widget.product.productImages[0],
              //       width: 60, height: 60,
              //       fit: BoxFit.cover,
              //     )),

              ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    widget.product.productImages[0],
                    width: 60, height: 60,
                    fit: BoxFit.cover,
                  )),

              const SizedBox(width: appPadding,),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.productName, style: GoogleFonts.poppins(
                    color: textColor,
                    fontSize: 15,
                  ),),

                  Text(
                    "\$${widget.product.productPrice}", style: TextStyle(
                    color: textColor.withOpacity(0.4),
                    fontSize: 13,
                    overflow: TextOverflow.ellipsis,
                  ),),
                ],
              ),


            ],
          ),
        ],
      ),
    );
  }
}