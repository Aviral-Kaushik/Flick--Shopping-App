import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleTextArea extends StatelessWidget {
  const SimpleTextArea({super.key,
    required this.labelText,
    required this.controller,
    required this.minLines,
    required this.maxLines,
    required this.onChanged});

  final String labelText;
  final TextEditingController controller;
  final int minLines;
  final int maxLines;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          labelText: "Message",
          alignLabelWithHint: true,
          labelStyle:
          GoogleFonts.poppins(fontSize: 14, color: blackColor),
          contentPadding: const EdgeInsets.all(appPadding / 4)),
      controller: controller,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.multiline,
      minLines: 5,
      maxLines: 20,
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400, fontSize: 14, color: blackColor),
      onChanged: onChanged,
    );
  }
}
