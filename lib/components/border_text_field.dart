import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/Constants.dart';

class BorderTextField extends StatefulWidget {
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
  State<BorderTextField> createState() => _BorderTextFieldState();
}

class _BorderTextFieldState extends State<BorderTextField> {
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
        fillColor: widget.backgroundColor ?? const Color(0x33E5E4E2),
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
      onChanged: (String text) {
        // Call the callback with the updated text
        final cursorPosition = widget.controller.selection.baseOffset;

        // Call the callback function to send text back
        widget.onChanged(text);

        // Restore cursor position after text update
        setState(() {
          widget.controller.value = TextEditingValue(
            text: text,
            selection: TextSelection.collapsed(offset: cursorPosition),
          );
        });
      },
      onTap: widget.onTapped,
      readOnly: widget.readOnly);
  }
}
