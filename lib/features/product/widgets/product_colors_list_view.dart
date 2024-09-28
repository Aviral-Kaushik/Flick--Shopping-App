import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';

class ProductColorsListView extends StatefulWidget {
  const ProductColorsListView(
      {super.key, required this.availableHexColors, required this.selectedColor});

  final List<String> availableHexColors;
  final Function(String) selectedColor;

  @override
  State<ProductColorsListView> createState() => _ProductColorsListViewState();
}

class _ProductColorsListViewState extends State<ProductColorsListView> {
  String selectedColor = "";

  @override
  void initState() {
    super.initState();

    selectedColor = widget.availableHexColors.first;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.builder(
        itemCount: widget.availableHexColors.length,
        scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              selectedColor = widget.availableHexColors[index];
              setState(() {});
              widget.selectedColor(widget.availableHexColors[index]);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding / 2),
              child: ProductColorItemWidget(
                hexColor: widget.availableHexColors[index],
                isSelected: selectedColor == widget.availableHexColors[index],
              ),),
          );
        },
      ),
    );
  }
}

class ProductColorItemWidget extends StatefulWidget {
  const ProductColorItemWidget({super.key,
    required this.hexColor,
    required this.isSelected});

  final String hexColor;
  final bool isSelected;

  @override
  State<ProductColorItemWidget> createState() => _ProductColorItemWidgetState();
}

class _ProductColorItemWidgetState extends State<ProductColorItemWidget> {

  late int finalHexString;

  @override
  void initState() {
    super.initState();
    String hex = "FF${widget.hexColor}";
    finalHexString = int.parse(hex, radix: 16);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,

      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: widget.isSelected
              ? Border.all(color: Colors.black, width: 4)
              : Border.all(width: 0)),

      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(finalHexString),
        ),
        child: const Row(),
      ),
    );
  }
}

class ProductColor {
  final String hexColor;
  final bool isSelected;

  ProductColor(this.hexColor, this.isSelected);
}
