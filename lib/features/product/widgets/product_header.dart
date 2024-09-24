import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader(
      {super.key,
      required this.backButtonPressed,
      required this.favoriteButtonPressed});

  final Function() backButtonPressed;
  final Function() favoriteButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        GestureDetector(
          onTap: backButtonPressed,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(appPadding * 2),
              border: Border.all(color: Colors.black)
            ),

            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: appPadding / 2, vertical: appPadding),
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: blackColor,
                ),
              ),
            ),
          ),
        ),

        GestureDetector(
          onTap: favoriteButtonPressed,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(appPadding * 2),
                border: Border.all(color: Colors.black)
            ),

            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: appPadding / 2, vertical: appPadding),
              child: Center(
                child: Icon(
                  Icons.favorite,
                  size: 20,
                  color: blackColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
