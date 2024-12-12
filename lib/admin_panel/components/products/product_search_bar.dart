import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key,
    required this.searchController,
    required this.onSearchButtonPressed,
    required this.onFilterButtonPressed
  });

  final TextEditingController searchController;
  final Function() onSearchButtonPressed;
  final Function() onFilterButtonPressed;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Container(
            height: 50,
            width: width - 150,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(40),
            ),

            child: TextField(
              keyboardType: TextInputType.text,
              controller: searchController,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide(color: textFieldGreyBorder)),
                  labelText: "Search Product"),
            ),
          ),

          const SizedBox(
            width: appPadding / 2,
          ),

          GestureDetector(
            onTap: () {
              onSearchButtonPressed();
            },
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundColor: blackColor,
                child: Padding(
                  padding: const EdgeInsets.all(appPadding / 2),
                  child: Center(
                    child: Icon(
                      Icons.search,
                      size: 25,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
            width: appPadding / 2,
          ),

          GestureDetector(
            onTap: () {
              onFilterButtonPressed();
            },
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(appPadding / 2),
                  child: Center(
                    child: Icon(
                      Icons.filter_list_alt,
                      size: 25,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
