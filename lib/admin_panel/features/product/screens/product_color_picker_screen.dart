import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/components/simple_button.dart';
import 'package:flick/helper/SnackbarHelper.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class ProductColorPickerScreen extends StatefulWidget {
  const ProductColorPickerScreen({super.key, required this.selectedColors});

  final Function(List<String> selectedColors) selectedColors;

  @override
  State<ProductColorPickerScreen> createState() => _ProductColorPickerScreenState();
}

class _ProductColorPickerScreenState extends State<ProductColorPickerScreen> {
  List<String> pickedColors = [];

  Color currentColor = const Color(0xFF0000FF);

  void showSnackBar(String text) {
    SnackBarHelper().showSnackBar(context, text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(appPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AdminAppBar(),

                const SizedBox(
                  height: appPadding * 2,
                ),

                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 2,
                    child: ColorPicker(
                      color: const Color(0xFF0000FF),
                      onColorChanged: (Color color) =>
                          setState(() => currentColor = color),
                      width: 44,
                      height: 44,
                      borderRadius: 22,
                      enableShadesSelection: true,
                      heading: Text(
                        'Select Product color',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      subheading: Text(
                        'Select color shade',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                SimpleButton(
                    buttonText: "Add Current Selected Color",
                    backgroundColor: Colors.transparent,
                    textColor: Colors.black,
                    showBorder: true,
                    onPressed: () {
                      if (!pickedColors.contains(currentColor.hex)) {
                        pickedColors.add(currentColor.hex);
                        showSnackBar("Color Added!");
                      } else {
                        showSnackBar("Color already selected!");
                      }
                    }),

                const SizedBox(height: appPadding,),

                SimpleButton(
                    buttonText: "Complete Selection",
                    backgroundColor: Colors.blueAccent,
                    onPressed: () {
                      widget.selectedColors(pickedColors);
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        ));
  }
}
