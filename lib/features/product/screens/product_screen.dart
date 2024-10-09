import 'package:carousel_slider/carousel_slider.dart';
import 'package:flick/features/product/blocs/ratings/ratings_bloc.dart';
import 'package:flick/features/product/blocs/ratings/ratings_state.dart';
import 'package:flick/features/product/widgets/product_colors_list_view.dart';
import 'package:flick/features/product/widgets/product_header.dart';
import 'package:flick/features/product/widgets/product_screen_buttons.dart';
import 'package:flick/helper/DialogHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/utils/Colors.dart';
import 'package:flick/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product});

  final Product? product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  final RatingsBloc ratingsBloc = locator.get<RatingsBloc>();
  late DialogHelper dialogHelper;


  @override
  void initState() {
    super.initState();

    dialogHelper = DialogHelper(context);
  }

  priceAndColorsRowWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        // Price Column
        Column(
          children: [
            Text("PRICE: ", style: GoogleFonts.montserrat(
              color: blackColor,
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),),

            Text("\$ ${widget.product?.productPrice}", style: GoogleFonts.raleway(
                color: blackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),),
          ],
        ),

        // Colors Column
        if (widget.product != null && widget.product!.availableColors.isNotEmpty)
          Column(
            children: [
              Text("COLORS: ", style: GoogleFonts.montserrat(
                  color: blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ),),

              const SizedBox(height: 4,),

              // Colors List
              SizedBox(
                width: widget.product!.availableColors.length * 33.3,
                child: ProductColorsListView(
                    availableHexColors: widget.product!.availableColors,
                    selectedColor: (String selectedColor) {}),
              ),
            ],
          ),
      ],
    );
  }

  addToCartAndBuyNowButtonsWidgets() {
    return Column(
      children: [
        ProductScreenButtons(
            buttonText: "Add To Cart!",
            onActionPerformed: () {
              // Add item to cart
            },
            showAddToCartButton: true),

        const SizedBox(height: appPadding,),

        ProductScreenButtons(
            buttonText: "Buy Now!",
            onActionPerformed: () {
              // Buy that item
            },
            showAddToCartButton: false),
      ],
    );
  }

  productDescription() {
    return Column(
      children: [

        Text(
          "Product Description",
          style: GoogleFonts.montserrat(
              color: blackColor, fontSize: 18, fontWeight: FontWeight.w800),
        ),

        const SizedBox(height: appPadding,),

        Text(
          widget.product?.productDescription ?? "",
          style: GoogleFonts.montserrat(
              color: blackColor, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RatingsBloc>(
      create: (_) => ratingsBloc,
      child: BlocListener<RatingsBloc, RatingsState>(
        listener: (context, state) {

          if (state is RatingsProgress) {

          }

          if (state is ProductRatingsFetched) {

          }

          if (state is RatingsError) {

          }

        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: primaryColor,

            body: SingleChildScrollView(
              padding: const EdgeInsets.all(appPadding * 1.5),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ProductHeader(
                      backButtonPressed: () {
                        Navigator.pop(context);
                      }, favoriteButtonPressed: () {}),

                  const SizedBox(height: appPadding * 2,),

                  Text(
                    "${widget.product?.productName}",
                    style: GoogleFonts.raleway(
                        color: blackColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "${widget.product?.productCategory}",
                    style: GoogleFonts.raleway(
                        color: blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(width: appPadding * 2,),

                  if (widget.product != null && widget.product!.productImages.isNotEmpty)
                    CarouselSlider(
                      items: widget.product!.productImages.map((e) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(appPadding)
                          ),

                          child:  Image.asset(
                            e,
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                          ),
                        );
                      }).toList(),

                      options: CarouselOptions(
                        height: 300,
                        enableInfiniteScroll:
                          (widget.product!.productImages.length == 1)
                              ? false
                              : true),
                    ),

                  const SizedBox(height: appPadding * 2,),

                  priceAndColorsRowWidget(),

                  const SizedBox(height: appPadding * 2,),

                  addToCartAndBuyNowButtonsWidgets(),

                  const SizedBox(height: appPadding * 2,),

                  productDescription(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}