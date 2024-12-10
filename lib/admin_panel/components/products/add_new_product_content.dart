import 'dart:io';

import 'package:flick/admin_panel/blocs/add_new_product/add_new_product_bloc.dart';
import 'package:flick/admin_panel/blocs/add_new_product/add_new_product_event.dart';
import 'package:flick/admin_panel/blocs/add_new_product/add_new_product_state.dart';
import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/features/product/screens/product_color_picker_screen.dart';
import 'package:flick/components/border_text_area.dart';
import 'package:flick/components/border_text_field.dart';
import 'package:flick/components/simple_button.dart';
import 'package:flick/helper/DialogHelper.dart';
import 'package:flick/helper/SnackbarHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/User.dart';

class AddNewProductContent extends StatefulWidget {
  const AddNewProductContent({super.key});

  @override
  State<AddNewProductContent> createState() => _AddNewProductContentState();
}

class _AddNewProductContentState extends State<AddNewProductContent> {

  AddNewProductBloc addNewProductBloc = locator.get<AddNewProductBloc>();

  late DialogHelper dialogHelper;

  List<XFile>? productImages = [];
  ImagePicker imagePicker = ImagePicker();
  SnackBarHelper snackBarHelper = SnackBarHelper();

  bool isAnyDialogShowing = false;

  String selectedCategory = "Electronics";

  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productStockController = TextEditingController();
  TextEditingController productCategoryController = TextEditingController();

  List<String> selectedColors = [];

  @override
  void initState() {
    super.initState();

    dialogHelper = DialogHelper(context);
    productCategoryController.text = productCategories[0].value ?? "";
  }

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

  Future<void> getProductImagesFromGalley() async {
    List<XFile>? images = await imagePicker.pickMultiImage();

    setState(() {
      productImages = images;
    });
  }

    Product getProduct(User user, int productPrice, int productStock) {
    return Product(
        id: "",
        productName: productNameController.text,
        productDescription: productDescriptionController.text,
        productImages: [],
        productRating: 0.0,
        productPrice: productPrice,
        totalPurchases: 0,
        stock: productStock,
        sellerName: user.name,
        productCategory: productCategoryController.text,
        availableColors: selectedColors);
  }

  void validateAndProcessProductDetails() async {
    User? user = await User.instance;

    if (productNameController.text.isEmpty
        || productDescriptionController.text.isEmpty
        || productPriceController.text.isEmpty
        || productStockController.text.isEmpty
        || productCategoryController.text.isEmpty
    ) {
      snackBarHelper.showSnackBar(context, "Please fill all the fields");
      return;
    }

    if (user == null) {
      snackBarHelper.showSnackBar(context, "Can't create product right now");
      return;
    }

    int? productStock = int.tryParse(productStockController.text);
    int? productPrice = int.tryParse(productPriceController.text);

    if (productStock == null) {
      snackBarHelper.showSnackBar(context, "Please enter valid stock");
      return;
    }

    if (productPrice == null) {
      snackBarHelper.showSnackBar(context, "Please enter valid price");
      return;
    }

    if (productImages == null || (productImages ?? []).isEmpty) {
      snackBarHelper.showSnackBar(context, "Please select product images");
      return;
    }

    addNewProductBloc.add(AddNewProduct(
        getProduct(user, productPrice, productStock), user.name, productImages ?? []));
  }

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

  getProductImagesWidget() {
    if (productImages == null || productImages!.isEmpty) {
      return const SizedBox();
    }

    return SizedBox(
      width: double.infinity,
      height: 75,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: productImages!.length > 3 ? 3 : productImages!.length,
          itemBuilder: (context, index) {

            return Padding(
              padding: const EdgeInsets.only(right: appPadding),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(appPadding),

                child: Image.file(
                  File(productImages![index].path),
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
      ),
    );
  }

  showProgressDialog(String message) {
    isAnyDialogShowing = true;

    dialogHelper.showProgressDialog(message, () {
      isAnyDialogShowing = false;
    });
  }

  showSuccessAndErrorDialog(String message, bool showUIForErrorDialog, bool finalDialog) {
    isAnyDialogShowing = true;

    dialogHelper.showSuccessfulOrErrorDialog(
        showUIForErrorDialog ? "Oops!" : "Success",
        message,
        showUIForErrorDialog ? "Dismiss" : "Okay",
        showUIForErrorDialog, () {
      isAnyDialogShowing = false;
      if (finalDialog) {
        Navigator.pop(context);
        Navigator.pop(context);
      }
    });
  }

  dismissAllDialogs() {
    if (isAnyDialogShowing) {

      isAnyDialogShowing = false;

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => addNewProductBloc,
      child: BlocListener<AddNewProductBloc, AddNewProductState>(
        listener: (context, state) {

          if (state is AddNewProductLoading) {
            dismissAllDialogs();
            showProgressDialog(state.progressMessage);
          }

          if (state is ProductImagesUploadedSuccessfully) {
            debugPrint("Product Images Uploaded Successfully");
          }

          if (state is ProductImagesUploadFailed) {
            dismissAllDialogs();
            showSuccessAndErrorDialog(state.errorMessage, true, false);
          }

          if (state is ProductAddedSuccessfully) {
            dismissAllDialogs();
            showSuccessAndErrorDialog("Product Added Successfully", false, true);
          }

          if (state is ProductAddFailed) {
            dismissAllDialogs();
            showSuccessAndErrorDialog(state.errorMessage, true, false);
          }

        },
        child: SafeArea(
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
                SimpleButton(
                    buttonText: "Add Product Color",
                    backgroundColor: Colors.transparent,
                    textColor: Colors.black,
                    showBorder: true,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (_) => ProductColorPickerScreen(
                                    selectedColors: (List<String> colors) {
                                      setState(() {
                                        selectedColors = colors;
                                      });
                                    },
                                  )));
                    }),

                if (selectedColors.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(right: appPadding, top: 4.0),
                    child: Text(
                      "Added ${selectedColors.length} colors.",

                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: blackColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),


                if (productImages != null && productImages!.isNotEmpty)
                  const SizedBox(height: appPadding * 2,),

                  getProductImagesWidget(),

                  if (productImages!.length > 3 &&
                      productImages!.length - 3 > 0)
                    Padding(
                      padding: const EdgeInsets.only(right: appPadding, top: 4.0),
                      child: Text(
                        "And ${productImages!.length - 3} more images",
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: blackColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),

                const SizedBox(
                  height: appPadding * 1.5,
                ),

                SimpleButton(
                    buttonText: "Upload Images",
                    backgroundColor: Colors.transparent,
                    textColor: Colors.black,
                    showBorder: true,
                    onPressed: () {
                      getProductImagesFromGalley();
                    }),

                const SizedBox(
                  height: appPadding * 1.5,
                ),

                SimpleButton(
                    buttonText: "Submit",
                    backgroundColor: Colors.blueAccent,
                    onPressed: () {
                      validateAndProcessProductDetails();
                    })

                // Library Can be used for color picker feature https://pub.dev/packages/flex_color_picker/example
              ],
            ),
          ),
        ),
      ),
    );
  }
}
