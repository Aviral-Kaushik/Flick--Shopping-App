import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/components/border_text_area.dart';
import 'package:flick/components/border_text_field.dart';
import 'package:flick/components/simple_button.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewProductContent extends StatefulWidget {
  const AddNewProductContent({super.key});

  @override
  State<AddNewProductContent> createState() => _AddNewProductContentState();
}

class _AddNewProductContentState extends State<AddNewProductContent> {

  List<DropdownMenuItem<String>> get productCategories {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Electronics", child: Text("Electronics")),
      const DropdownMenuItem(value: "Sports", child: Text("Sports")),
      const DropdownMenuItem(value: "Fitness", child: Text("Fitness")),
      const DropdownMenuItem(value: "Smartphones", child: Text("Smartphones")),
      const DropdownMenuItem(value: "Laptops", child: Text("Laptops")),
      const DropdownMenuItem(value: "Wearables", child: Text("Wearables")),
      const DropdownMenuItem(value: "Accessories", child: Text("Accessories")),
      const DropdownMenuItem(value: "Home", child: Text("Home")),
      const DropdownMenuItem(value: "Beauty", child: Text("Beauty")),
      const DropdownMenuItem(value: "Games", child: Text("Games")),
      const DropdownMenuItem(value: "PC Softwares", child: Text("PC Softwares")),
    ];
    return menuItems;
  }

  String selectedCategory = "Electronics";

  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productStockController = TextEditingController();
  TextEditingController productCategoryController = TextEditingController();
  TextEditingController productColorController = TextEditingController();

  textFieldTitleTextWidget(String title) {
    return Text(
      title, style: GoogleFonts.lato(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: blackColor,
      ),
    );
  }

  productCategoryDropdownWidget() {
    return DropdownButtonFormField(
      decoration: InputDecoration(
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
      value: selectedCategory,
      items: productCategories,
      onChanged: (String? value) {
        if (value != null && value.isNotEmpty) {
          productCategoryController.text = value;
          setState(() {
            selectedCategory = value;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
            bottom: appPadding, left: appPadding, right: appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdminAppBar(),
            const SizedBox(
              height: appPadding * 2,
            ),

            Text("Create New Product",
                style: GoogleFonts.poppins(
                    fontSize: 24,
                    color: blackColor,
                    fontWeight: FontWeight.w800)),

            const SizedBox(
              height: appPadding,
            ),

            /* We need to take the following inputs from the user
            1. Product Name
            2. Product Description
            3. Product Price
            4. Stock
            5. Product Category
            6. Available Colors
            */

            // Product Name
            textFieldTitleTextWidget("Product Name"),

            const SizedBox(
              height: appPadding / 2,
            ),

            BorderTextField(
                labelText: "Product Name",
                controller: productNameController,
                onChanged: (String currentText) {
                  productNameController.text = currentText;
                }),

            const SizedBox(
              height: appPadding,
            ),

            // Product Description
            textFieldTitleTextWidget("Product Description"),

            const SizedBox(
              height: appPadding / 2,
            ),

            BorderTextArea(
                labelText: "Product Description",
                controller: productDescriptionController,
                minLines: 1,
                maxLines: 5,
                onChanged: (String currentText) {
                  productDescriptionController.text = currentText;
                }),

            const SizedBox(
              height: appPadding,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Price
                      textFieldTitleTextWidget("Product Price"),

                      const SizedBox(
                        height: appPadding / 2,
                      ),

                      BorderTextField(
                          labelText: "Product Price",
                          controller: productPriceController,
                          onChanged: (String currentText) {
                            productPriceController.text = currentText;
                          }),
                    ],
                  ),
                ),

                const SizedBox(
                  width: appPadding,
                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Stock
                      textFieldTitleTextWidget("Product Stock"),

                      const SizedBox(
                        height: appPadding / 2,
                      ),

                      BorderTextField(
                          labelText: "Product Stock",
                          controller: productStockController,
                          onChanged: (String currentText) {
                            productStockController.text = currentText;
                          }),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: appPadding,
            ),

            // Product Category
            textFieldTitleTextWidget("Product Category"),

            const SizedBox(
              height: appPadding / 2,
            ),

            productCategoryDropdownWidget(),

            const SizedBox(
              height: appPadding,
            ),

            // Product Color
            textFieldTitleTextWidget("Product Color"),

            const SizedBox(
              height: appPadding / 2,
            ),

            BorderTextField(
                labelText: "Product Color",
                controller: productColorController,
                onChanged: (String currentText) {
                  productColorController.text = currentText;
                }),

            const SizedBox(
              height: appPadding * 1.5,
            ),

            SimpleButton(
                buttonText: "Submit",
                backgroundColor: Colors.blueAccent,
                onPressed: () {
                  // TODO Create Product Here
                })

            // Library Can be used for color picker feature https://pub.dev/packages/flex_color_picker/example
          ],
        ),
      ),
    );
  }
}
