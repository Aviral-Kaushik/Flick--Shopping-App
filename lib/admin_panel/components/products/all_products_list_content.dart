import 'package:flick/admin_panel/components/appbar/AdminAppBar.dart';
import 'package:flick/admin_panel/components/products/product_search_bar.dart';
import 'package:flick/admin_panel/components/products/single_product_list_item.dart';
import 'package:flick/admin_panel/components/widgets/dialogs/filter_dialog.dart';
import 'package:flick/admin_panel/data/Data.dart';
import 'package:flick/admin_panel/helper/user_product_filter.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllProductsListContent extends StatefulWidget {
  const AllProductsListContent({super.key});

  @override
  State<AllProductsListContent> createState() => _AllProductsListContentState();
}

class _AllProductsListContentState extends State<AllProductsListContent> {

  List<Product> products = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    products = getDummyProducts();
  }

  void showProductFilterDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => FilterDialog(
            filterToBeApplied: (UserProductFilter productFilter) {
              // usersBloc.add(ApplyFilter(userFilter));
            },
            title: "Filter Products"
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
        ));
  }
}
