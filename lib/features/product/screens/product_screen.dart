import 'package:flick/features/product/widgets/product_header.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product});

  final Product product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,

        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              horizontal: appPadding, vertical: appPadding * 1.5),

          child: Column(
            children: [

              ProductHeader(
                  backButtonPressed: () {}, favoriteButtonPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
