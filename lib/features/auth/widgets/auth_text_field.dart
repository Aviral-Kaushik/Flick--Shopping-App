import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/Constants.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({super.key,
    required this.labelText,
    required this.isPasswordField,
    required this.onTextChanged,
    required this.textEditingController});

  final String labelText;
  final bool isPasswordField;
  final Function(String text) onTextChanged;
  final TextEditingController textEditingController;

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
      controller: textEditingController,
      textCapitalization:
          !isPasswordField ? TextCapitalization.words : TextCapitalization.none,
      onChanged: (String text) {
        onTextChanged(text);
      },
      obscureText: isPasswordField,
      enableSuggestions: !isPasswordField,
      autocorrect: !isPasswordField,
    );
  }
}
