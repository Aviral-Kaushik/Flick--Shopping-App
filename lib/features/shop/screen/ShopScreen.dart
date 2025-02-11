import 'package:flick/admin_panel/blocs/products/products_bloc.dart';
import 'package:flick/admin_panel/blocs/products/products_event.dart';
import 'package:flick/admin_panel/blocs/products/products_state.dart';
import 'package:flick/data/database/hive_service.dart';
import 'package:flick/features/shop/component/products_list_view_widget.dart';
import 'package:flick/helper/SnackbarHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/models/category_wise_products.dart';
import 'package:flick/models/order_product.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flick/utils/mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> with AutomaticKeepAliveClientMixin {

  final HiveService hiveService = locator.get<HiveService>();
  final ProductsBloc productsBloc = locator.get<ProductsBloc>();

  final SnackBarHelper snackBarHelper = SnackBarHelper();

  late CategoryWiseProducts categoryWiseProducts;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    if (productsBloc.state is! FetchedAllProducts) {  // Fetch only if not already loaded
      productsBloc.add(const FetchAllProducts());
    }

    productsBloc.add(const FetchAllProducts());
  }

  void addShoppingItemToCart(Product product) async {

    await hiveService.addProductToCart(
        OrderProduct.fromProduct(product, 1));

    snackBarHelper.showSnackBar(context, "Added to cart!");
    setState(() {});
  }

  Widget productsLoadingWidget() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const CircularProgressIndicator(),

            const SizedBox(height: appPadding * 2),

            Text(
              "Loading products...",
              style: GoogleFonts.roboto(
                color: blackColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      )
    );
  }


  Widget productLoadedLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // search bar
          Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: searchBarBackgroundColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.search),
                  Text(
                    "Search",
                    style: TextStyle(color: subTitleTextColor),
                  ),
                ],
              )),

          // message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              "everyone flies... some fly longer than others",
              style: TextStyle(color: quoteTextColor),
            ),
          ),

          ProductsListViewWidget(
              context: context,
              title: "Hot Picks 🔥",
              products: categoryWiseProducts.wearableProducts,
              addShoppingItemToCart: (Product product) {
                addShoppingItemToCart(product);
              }
          ),

          const SizedBox(height: appPadding),

          ProductsListViewWidget(
              context: context,
              title: "Laptops",
              products: categoryWiseProducts.laptopsProducts,
              addShoppingItemToCart: (Product product) {
                addShoppingItemToCart(product);
              }
          ),

          const SizedBox(height: appPadding),

          ProductsListViewWidget(
              context: context,
              title: "Sports",
              products: categoryWiseProducts.sportsProducts,
              addShoppingItemToCart: (Product product) {
                addShoppingItemToCart(product);
              }
          ),

          const SizedBox(height: appPadding),

          ProductsListViewWidget(
              context: context,
              title: "Fitness",
              products: categoryWiseProducts.fitnessProducts,
              addShoppingItemToCart: (Product product) {
                addShoppingItemToCart(product);
              }
          ),

          Padding(
            padding:
            const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Divider(
              color: whiteTextColor,
            ),
          )
        ],
      ),
    );
  }

  Widget errorLayout() {
    return Expanded(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const Icon(
                Icons.error_outline_sharp,
                color: Colors.redAccent,
                size: 30,),

              const SizedBox(height: appPadding * 2),

              Text(
                "Something went wrong, please try again later!",
                style: GoogleFonts.roboto(
                  color: whiteTextColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
        bloc: productsBloc,
        builder: (context, state) {

          if (state is ProductLoading) {
            return productsLoadingWidget();
          } else if (state is FetchedAllProducts) {
            List<Product> products = state.products;

            if (products.isNotEmpty) {
              categoryWiseProducts = getCategoryWiseProducts(products);
              return productLoadedLayout();
            } else {
              return errorLayout();
            }
          } else if (state is ProductsError) {
            return errorLayout();
          }

          return Container();
        }
    );
  }
}