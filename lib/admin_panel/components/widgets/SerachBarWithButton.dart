import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class SearchBarWithButton extends StatelessWidget {
  const SearchBarWithButton({super.key,
    required this.searchController,
    this.onPressed});

  final TextEditingController searchController;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        Expanded(
          flex: 2,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(40),
            ),

            child: TextField(
              keyboardType: TextInputType.text,
              controller: searchController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide(color: textFieldGreyBorder)),
                  labelText: "Email"),
            ),
          ),
        ),

        const SizedBox(
          width: appPadding / 2,
        ),

        Expanded(
          flex: 1,
          child: SizedBox(
            height: 50,

            child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(backgroundColor:
              MaterialStateProperty.resolveWith((states) {
                return blackColor;
              }), textStyle: MaterialStateProperty.resolveWith((states) {
                return TextStyle(
                  color: whiteTextColor,
                  fontSize: 17,
                );
              })),

              child: Text(
                "Search",
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
