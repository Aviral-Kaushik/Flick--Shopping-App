import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/Constants.dart';

class BorderTextField extends StatelessWidget {
  const BorderTextField({super.key,
    required this.labelText,
    required this.controller,
    this.backgroundColor,
    this.readOnly = false,
    required this.onChanged,
    this.onTapped});

  final String labelText;
  final TextEditingController controller;
  final bool readOnly;
  final Color? backgroundColor;
  final Function(String text) onChanged;
  final Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        alignLabelWithHint: true,
        labelStyle: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xFFA6A6A6)
        ),

        contentPadding: const EdgeInsets.all(appPadding),
        fillColor: backgroundColor ?? const Color(0x33E5E4E2),
        filled: true,

        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFF1F1F1), width: 1.0),
          borderRadius: BorderRadius.circular(appPadding / 2),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFA6A6A6), width: 1.0),
          borderRadius: BorderRadius.circular(appPadding / 2),
        ),
      ),
      controller: controller,
      onChanged: (String text) {
        onChanged(text);
      },
      onTap: onTapped,
      readOnly: readOnly);
  }
}
