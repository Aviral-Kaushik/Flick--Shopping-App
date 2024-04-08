import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final void Function(String currentText) onTextChanged;
  final void Function() onEditingComplete;

  const SearchField(
      {super.key,
      required this.hintText,
      required this.onTextChanged,
      required this.onEditingComplete});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: hintText,
          helperStyle:
              TextStyle(color: textColor.withOpacity(0.5), fontSize: 15),
          fillColor: secondaryColor,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          prefixIcon: Icon(Icons.search, color: textColor.withOpacity(0.5))),
      onChanged: (s) => onTextChanged(s),
      onSubmitted: (s) => onTextChanged(s),
      onEditingComplete: onEditingComplete,
    );
  }
}
