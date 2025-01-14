import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    super.key,
    required this.selectedValue,
    required this.dropDownItems,
    this.backgroundColor,
    required this.onChanged});

  final String selectedValue;
  final List<DropdownMenuItem<String>> dropDownItems;
  final Color? backgroundColor;
  final Function(String) onChanged;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {

  String selectedValue = "";

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
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
      value: selectedValue,
      items: widget.dropDownItems,
      onChanged: (String? value) {
        if (value != null && value.isNotEmpty) {
          widget.onChanged(value);
          setState(() {
            selectedValue = value;
          });
        }
      },
    );
  }
}
