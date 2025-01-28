import 'package:flick/components/simple_header.dart';
import 'package:flick/data/database/hive_service.dart';
import 'package:flick/features/favourites/components/favourite_product_card.dart';
import 'package:flick/helper/SnackbarHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/models/order_product.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteProductsListScreen extends StatefulWidget {
  const FavouriteProductsListScreen({super.key});

  @override
  State<FavouriteProductsListScreen> createState() => _FavouriteProductsListScreenState();
}

class _FavouriteProductsListScreenState extends State<FavouriteProductsListScreen> {

  final HiveService _hiveService = locator.get<HiveService>();
  final SnackBarHelper _snackBarHelper = SnackBarHelper();

  List<Product> favouriteProducts = [];

  @override
  void initState() {
    super.initState();

    getFavouriteProducts();
  }

  void getFavouriteProducts() {
    favouriteProducts = _hiveService.getAllFavouritesProducts();
    setState(() {});
  }

  Future<void> addProductToCart(Product product) async {
    await _hiveService.addProductToCart(
        getOrderProduct(product));

    _snackBarHelper.showSnackBar(context, "Added to cart!");

    setState(() {});
  }

  OrderProduct getOrderProduct(Product product) {
    return OrderProduct.fromProduct(product, 1);
  }

  Future<void> deleteProductFromFavourites(String productId) async {
    await _hiveService.removeItemFromFavourites(productId);

    _snackBarHelper.showSnackBar(context, "Removed from Favourites!");

    getFavouriteProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Column(
            children: [
              const SimpleHeader(title: "Favorites"),

              const SizedBox(height: appPadding,),

            if (favouriteProducts.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                  "No items in cart!",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                    itemCount: favouriteProducts.length,
                    itemBuilder: (context, index) {
                      Product product = favouriteProducts[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: appPadding / 2),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, "/productScreen",
                                arguments: product);
                          },
                          child: FavouriteProductCard(
                            product: product,
                            hiveService: _hiveService,
                            onAddToCartPressed: () async {
                              await addProductToCart(product);
                            },
                            onDeleteButtonPressed: () async {
                              await deleteProductFromFavourites(product.id);
                            },
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
