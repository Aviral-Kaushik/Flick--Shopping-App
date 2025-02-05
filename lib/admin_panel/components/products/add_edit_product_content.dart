import 'dart:io';

import 'package:flick/admin_panel/blocs/add_new_product/add_edit_product_bloc.dart';
import 'package:flick/admin_panel/blocs/add_new_product/add_edit_product_event.dart';
import 'package:flick/admin_panel/blocs/add_new_product/add_edit_product_state.dart';
import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/features/product/screens/product_color_picker_screen.dart';
import 'package:flick/components/border_text_area.dart';
import 'package:flick/components/border_text_field.dart';
import 'package:flick/components/drop_down_widget.dart';
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

class AddEditProductContent extends StatefulWidget {
  const AddEditProductContent({super.key, this.product});

  final Product? product;

  @override
  State<AddEditProductContent> createState() => _AddEditProductContentState();
}

class _AddEditProductContentState extends State<AddEditProductContent> {

  AddEditProductBloc addNewProductBloc = locator.get<AddEditProductBloc>();

  late DialogHelper dialogHelper;

  List<XFile>? productImagesXFiles = [];
  List<String> productImagesBackend = [];
  ImagePicker imagePicker = ImagePicker();
  SnackBarHelper snackBarHelper = SnackBarHelper();

  bool isAnyDialogShowing = false;
  bool showUIForProductUpdate = false;
  bool hasImagesUpdatedForProductUpdate = false;

  String? selectedCategory = "Electronics";

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

    if (widget.product != null) {
      setUpWidgetForProductUpdate();
    }

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
      hasImagesUpdatedForProductUpdate = true;
      productImagesXFiles = images;
    });
  }

    Product getProduct(User user, int productPrice, int productStock) {
    return Product(
        id: widget.product != null ? widget.product!.id : "",
        productName: productNameController.text,
        productDescription: productDescriptionController.text,
        productImages: widget.product != null ? widget.product!.productImages : [],
        productRating: widget.product != null ? widget.product!.productRating : 0.0,
        productPrice: productPrice,
        totalPurchases: widget.product != null ? widget.product!.totalPurchases : 0,
        stock: productStock,
        sellerName: user.name,
        productCategory: productCategoryController.text,
        availableColors: selectedColors);
  }


  void setUpWidgetForProductUpdate() {
    showUIForProductUpdate = true;

    productImagesXFiles = [];

    productNameController.text = widget.product!.productName;
    productDescriptionController.text = widget.product!.productDescription;
    productPriceController.text = widget.product!.productPrice.toString();
    productStockController.text = widget.product!.stock.toString();
    productCategoryController.text = widget.product!.productCategory;

    selectedColors = widget.product!.availableColors;
    selectedCategory = productCategories
        .where((element) => element.value == widget.product!.productCategory)
        .first.value;

    productImagesBackend = widget.product!.productImages;

    setState(() {});
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

    if (showUIForProductUpdate) {
      if (hasImagesUpdatedForProductUpdate &&
          (productImagesXFiles == null ||
              (productImagesXFiles ?? []).isEmpty)) {
        snackBarHelper.showSnackBar(context, "Please select product images");
        return;
      }
    } else {
      if (productImagesXFiles == null || (productImagesXFiles ?? []).isEmpty) {
        snackBarHelper.showSnackBar(context, "Please select product images");
        return;
      }
    }

    if (showUIForProductUpdate) {
      addNewProductBloc.add(EditProduct(
          getProduct(user, productPrice, productStock),
          hasImagesUpdatedForProductUpdate,
          productImagesXFiles ?? []));
      return;
    }

    addNewProductBloc.add(AddNewProduct(
        getProduct(user, productPrice, productStock),
        user.name,
        productImagesXFiles ?? []));
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
    return DropDownWidget(
        selectedValue: selectedCategory ?? "Electronics",
        dropDownItems: productCategories,
        backgroundColor: whiteColor,
        onChanged: (String value) {
          productCategoryController.text = value;
          setState(() {
            selectedCategory = value;
          });
        });
  }

  Widget getProductImagesCountWidget() {

    if (showUIForProductUpdate) {
      if (productImagesBackend.length > 3 &&
          productImagesBackend.length - 3 > 0) {
        return Padding(
          padding: const EdgeInsets.only(right: appPadding, top: 4.0),
          child: Text(
            "And ${productImagesBackend.length - 3} more images",
            style: GoogleFonts.poppins(
                fontSize: 12,
                color: blackColor,
                fontWeight: FontWeight.w600),
          ),
        );
      }
    }

    if (productImagesXFiles!.length > 3 &&
        productImagesXFiles!.length - 3 > 0) {
      return Padding(
        padding: const EdgeInsets.only(right: appPadding, top: 4.0),
        child: Text(
          "And ${productImagesXFiles!.length - 3} more images",
          style: GoogleFonts.poppins(
              fontSize: 12, color: blackColor, fontWeight: FontWeight.w600),
        ),
      );
    }

    return const SizedBox();
  }

  Widget getProductImagesWidget() {
    if (!showUIForProductUpdate && (productImagesXFiles == null || productImagesXFiles!.isEmpty)) {
      return const SizedBox();
    }

    bool useXFilesForShowingImages = !showUIForProductUpdate;

    return SizedBox(
      width: double.infinity,
      height: 75,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: getProductImagesCount(useXFilesForShowingImages),
          itemBuilder: (context, index) {

            return Padding(
              padding: const EdgeInsets.only(right: appPadding),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(appPadding),

                child: getProductImageForShowing(index, useXFilesForShowingImages),
              ),
            );
          }
      ),
    );
  }

  int getProductImagesCount(bool useXFilesForShowingImages) {
    return hasImagesUpdatedForProductUpdate || useXFilesForShowingImages
        ? productImagesXFiles!.length > 3
            ? 3
            : productImagesXFiles!.length
        : productImagesBackend.length > 3
            ? 3
            : productImagesBackend.length;
  }

  Image getProductImageForShowing(int index, bool useXFilesForShowingImages) {
    if (hasImagesUpdatedForProductUpdate || useXFilesForShowingImages) {
      return Image.file(
        File(productImagesXFiles![index].path),
        width: 75,
        height: 75,
        fit: BoxFit.cover,
      );
    }

    return Image.network(
      productImagesBackend[index],
      width: 75,
      height: 75,
      fit: BoxFit.cover,
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
    }, onButtonPressed: () {
      isAnyDialogShowing = false;
      if (finalDialog) {
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
      child: BlocListener<AddEditProductBloc, AddEditProductState>(
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

          if (state is ProductEditedSuccessfully) {
            dismissAllDialogs();
            showSuccessAndErrorDialog("Product Updated Successfully!", false, true);
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

                Text(showUIForProductUpdate ? "Update Product" : "Create New Product",
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
                                    previouslySelectedColors:
                                        widget.product?.availableColors,
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

                if (showUIForProductUpdate ||
                    (productImagesXFiles != null &&
                        productImagesXFiles!.isNotEmpty))
                  const SizedBox(
                    height: appPadding * 2,
                  ),

                  getProductImagesWidget(),

                  getProductImagesCountWidget(),

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
                    buttonText: showUIForProductUpdate ? "Update Product" : "Submit",
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
