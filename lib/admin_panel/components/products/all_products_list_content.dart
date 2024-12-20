import 'package:flick/admin_panel/blocs/products/products_bloc.dart';
import 'package:flick/admin_panel/blocs/products/products_event.dart';
import 'package:flick/admin_panel/blocs/products/products_state.dart';
import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/components/products/product_search_bar.dart';
import 'package:flick/admin_panel/components/products/single_product_list_item.dart';
import 'package:flick/admin_panel/components/widgets/dialogs/filter_dialog.dart';
import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/admin_panel/helper/user_product_filter.dart';
import 'package:flick/helper/DialogHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AllProductsListContent extends StatefulWidget {
  const AllProductsListContent({super.key});

  @override
  State<AllProductsListContent> createState() => _AllProductsListContentState();
}

class _AllProductsListContentState extends State<AllProductsListContent> {

  ProductsBloc productBloc = locator.get<ProductsBloc>();

  List<Product> products = [];

  TextEditingController searchController = TextEditingController();

  late DialogHelper dialogHelper;
  bool isAnyDialogShowing = false;

  @override
  void initState() {
    super.initState();

    products = getDummyProducts();

    dialogHelper = DialogHelper(context);

    productBloc.add(const FetchAllProducts());

    searchController.addListener(() {
      productBloc.add(SearchProducts(searchController.text));
    });
  }

  void showProductFilterDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => FilterDialog(
            filterToBeApplied: (UserProductFilter productFilter) {
              productBloc.add(ApplyFilter(productFilter));
            },
            title: "Filter Products"
        ));
  }

  showProgressDialog(String progressMessage) {
    isAnyDialogShowing = true;

    dialogHelper.showProgressDialog(progressMessage, () {
      isAnyDialogShowing = false;
    });
  }

  showSuccessAndErrorDialog(String message, bool showUIForErrorDialog) {
    isAnyDialogShowing = true;

    dialogHelper.showSuccessfulOrErrorDialog(
        showUIForErrorDialog ? "Oops!" : "Success",
        message,
        showUIForErrorDialog ? "Dismiss" : "Okay",
        showUIForErrorDialog, () {
      isAnyDialogShowing = false;
    });
  }

  dismissAllDialogs() {
    if (isAnyDialogShowing) {
      Navigator.pop(context);
      isAnyDialogShowing = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsBloc>(
      create: (context) => productBloc,
      child: BlocListener<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state is ProductLoading) {
            dismissAllDialogs();
            showProgressDialog(state.progressMessage);
          }

          if (state is FetchedAllProducts) {
            dismissAllDialogs();
            products = state.products;
            setState(() {});
          }

          if (state is ProductsError) {
            dismissAllDialogs();
            showSuccessAndErrorDialog(state.errorMessage, true);
          }
        },
        child: SafeArea(
            child: Column(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.only(
                      left: appPadding, right: appPadding, bottom: appPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AdminAppBar(),

                      const SizedBox(
                        height: appPadding,
                      ),

                      ProductSearchBar(
                      searchController: searchController,
                      onSearchButtonPressed: () {
                        // Search Button Pressed
                      },
                      onFilterButtonPressed: () {
                        showProductFilterDialog();
                      }),

                  // Column(
                      //   children: [
                      //     SearchBarWithButton(
                      //       searchController: searchController,
                      //       onPressed: () {
                      //         // Search Button Pressed
                      //       },
                      //       labelText: "Search Product",
                      //       showIconButton: true,
                      //     ),
                      //   ],
                      // ),
                      //
                      // const SizedBox(
                      //   width: appPadding / 2,
                      // ),
                      //
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     ElevatedButton(
                      //       onPressed: () {
                      //         showProductFilterDialog();
                      //       },
                      //         style: ButtonStyle(
                      //           backgroundColor: MaterialStateProperty.resolveWith((states) {
                      //             return Colors.blueAccent;
                      //           }),
                      //           textStyle: MaterialStateProperty.resolveWith((states) {
                      //             return TextStyle(
                      //               color: whiteTextColor,
                      //               fontSize: 13,
                      //             );
                      //           })
                      //         ),
                      //         child: Icon(Icons.filter_list_alt, color: whiteColor)
                      //     ),
                      //   ],
                      // ),

                      const SizedBox(
                        height: 12,
                      ),

                      const SizedBox(height: appPadding * 2,),

                      Container(
                        padding: const EdgeInsets.all(appPadding),
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(appPadding)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Text("Products", style: GoogleFonts.lato(
                                color: textColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                            ),),

                            const SizedBox(height: appPadding,),

                            products.isNotEmpty
                                ? ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: products.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                      onTap: () {
                                        // TODO Open Product User Page Here
                                      },
                                      child: SingleProductListLayout(
                                        product: products[index],
                                      ),
                                    )
                                  )
                                : const Center(
                              child: Text("No Product Found!"),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: appPadding * 2,),

                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
