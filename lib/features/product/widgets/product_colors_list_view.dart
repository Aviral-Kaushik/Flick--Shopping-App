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
  List<ProductColor> productsColors = [];

  @override
  void initState() {
    super.initState();

    generateProductColors(widget.availableHexColors);
  }

  void generateProductColors(List<String> colors) {
    List<ProductColor> productColors = [];

    for (int i = 0; i < colors.length; i++) {
      productColors.add(ProductColor(colors[i], i == 1));
    }

    setState(() {
      productsColors = productColors;
    });
  }

  void updateSelectedForColors(List<ProductColor> productColors1, int selectedIndex) {
    List<ProductColor> productColors2 = [];

    for (int i = 0; i < productColors1.length; i++) {
      productColors2.add(ProductColor(productColors1[i].hexColor, i == selectedIndex));
    }

    setState(() {
      productsColors = productColors2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.builder(
        itemCount: productsColors.length,
        scrollDirection: Axis.horizontal,

        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding / 2),
            child: ProductColorItemWidget(
              productColor: productsColors[index],
              colorSelected: () {
                updateSelectedForColors(productsColors, index);
                widget.selectedColor(productsColors[index].hexColor);
              },
            ),);
        },
      ),
    );
  }
}

class ProductColorItemWidget extends StatefulWidget {
  const ProductColorItemWidget({super.key,
    required this.productColor,
    required this.colorSelected});

  final ProductColor productColor;
  final Function() colorSelected;

  @override
  State<ProductColorItemWidget> createState() => _ProductColorItemWidgetState();
}

class _ProductColorItemWidgetState extends State<ProductColorItemWidget> {

  late int finalHexString;
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    String hex = "FF${widget.productColor.hexColor}";
    finalHexString = int.parse(hex, radix: 16);

    isSelected = widget.productColor.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // isSelected = !isSelected;
          widget.colorSelected;
        });
        // widget.isSelected = true;
      },
      child: Container(
        width: 20,
        height: 20,

        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: isSelected
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
      ),
    );
  }
}

class ProductColor {
  final String hexColor;
  final bool isSelected;

  ProductColor(this.hexColor, this.isSelected);
}
