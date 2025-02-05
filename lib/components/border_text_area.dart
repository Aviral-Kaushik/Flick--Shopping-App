import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BorderTextArea extends StatefulWidget {
  const BorderTextArea({super.key,
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
  State<BorderTextArea> createState() => _BorderTextAreaState();
}

class _BorderTextAreaState extends State<BorderTextArea> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: widget.labelText,
        alignLabelWithHint: true,
        labelStyle: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xFFA6A6A6)
        ),

        contentPadding: const EdgeInsets.all(appPadding),
        fillColor: const Color(0x33E5E4E2),
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
      controller: widget.controller,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.multiline,
      minLines: 5,
      maxLines: 20,
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400, fontSize: 14, color: blackColor),
      onChanged: (currentText) {
        // Preserve cursor position
        final cursorPosition = widget.controller.selection.baseOffset;

        // Call the callback function to send text back
        widget.onChanged(currentText);

        // Restore cursor position after text update
        setState(() {
          widget.controller.value = TextEditingValue(
            text: currentText,
            selection: TextSelection.collapsed(offset: cursorPosition),
          );
        });
      },
    );
  }
}
