import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleTextField extends StatelessWidget {
  const SimpleTextField({super.key,
    required this.labelText,
    required this.controller,
    required this.onChanged,
    this.labelColor, this.focusColor});

  final String labelText;
  final TextEditingController controller;
  final Function(String) onChanged;
  final Color? labelColor;
  final Color? focusColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          labelText: labelText,
          alignLabelWithHint: true,
          labelStyle: GoogleFonts.poppins(
              fontSize: 14,
              color: labelColor ?? blackColor
          ),
          contentPadding: const EdgeInsets.all(appPadding / 4),
          focusColor: focusColor
      ),
      controller: controller,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.emailAddress,
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400, fontSize: 14, color: blackColor),
      onChanged: onChanged,
    );
  }
}
