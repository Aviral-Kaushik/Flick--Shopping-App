import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IncrementAndDecrementWidget extends StatefulWidget {
  const IncrementAndDecrementWidget(
      {super.key,
      required this.selectedQuantity,
      this.textSize,
      this.iconSize,
      required this.onIncrementPressed,
      required this.onDecrementPressed});

  final int selectedQuantity;
  final double? textSize;
  final double? iconSize;
  final Function() onIncrementPressed;
  final Function() onDecrementPressed;

  @override
  State<IncrementAndDecrementWidget> createState() => _IncrementAndDecrementWidgetState();
}

class _IncrementAndDecrementWidgetState extends State<IncrementAndDecrementWidget> {
  int selectedQuantity = 1;

  @override
  void initState() {
    super.initState();
    selectedQuantity = widget.selectedQuantity;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        GestureDetector(
          onTap: selectedQuantity > 1
              ? () {
            selectedQuantity--;
            widget.onDecrementPressed();
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
              size: widget.iconSize ?? 20,
              color: whiteColor,
            ),
          ),
        ),

        const SizedBox(width: 10,),

        Text("$selectedQuantity", style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: blackColor,
            fontSize: widget.textSize ?? 15
        ),
        ),

        const SizedBox(width: 10,),

        GestureDetector(
          onTap: () {
            selectedQuantity++;
            widget.onIncrementPressed();
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
              size: widget.iconSize ?? 20,
              color: whiteColor,
            ),
          ),
        ),

      ],
    );
  }
}
