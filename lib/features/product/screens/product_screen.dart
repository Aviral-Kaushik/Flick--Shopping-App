import 'package:carousel_slider/carousel_slider.dart';
import 'package:flick/components/increment_and_decrement_widget.dart';
import 'package:flick/data/database/hive_service.dart';
import 'package:flick/features/product/blocs/ratings/ratings_bloc.dart';
import 'package:flick/features/product/blocs/ratings/ratings_event.dart';
import 'package:flick/features/product/blocs/ratings/ratings_state.dart';
import 'package:flick/features/product/models/ui_related_product_ratings.dart';
import 'package:flick/features/product/widgets/product_colors_list_view.dart';
import 'package:flick/features/product/widgets/product_header.dart';
import 'package:flick/features/product/widgets/product_screen_buttons.dart';
import 'package:flick/features/product/widgets/products_ratings_widget.dart';
import 'package:flick/helper/DialogHelper.dart';
import 'package:flick/helper/SnackbarHelper.dart';
import 'package:flick/locator.dart';
import 'package:flick/models/Product.dart';
import 'package:flick/models/User.dart';
import 'package:flick/models/order_product.dart';
import 'package:flick/models/pre_order.dart';
import 'package:flick/models/rating.dart';
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
  final HiveService _hiveService = locator.get<HiveService>();
  final SnackBarHelper _snackBarHelper = SnackBarHelper();

  late DialogHelper dialogHelper;

  UIRelatedProductRatings? uiRelatedProductRatings;

  User? user;

  int selectedQuantity = 1;

  bool isProductAlreadyInCart = false;
  bool isProductAlreadyInFavourites = false;

  @override
  void initState() {
    super.initState();

    dialogHelper = DialogHelper(context);

    loadInitialData();

    if (widget.product != null) {
      ratingsBloc.add(FetchProductRating(widget.product!.id));
    }
  }

  void loadInitialData() async {
    await loadUserData();

    if (widget.product != null) {
      isProductAlreadyInFavourites =
          await _hiveService.isInFavorites(widget.product!.id);

      isProductAlreadyInCart = await _hiveService.isInCart(widget.product!.id);

      setState(() {});
    }
  }

  Future<void> loadUserData() async {
    user = await User.instance;
  }

  PreOrder getPreOrder() {
    return PreOrder(
        orderProducts: [
          OrderProduct.fromProduct(widget.product!, selectedQuantity)
        ],
        totalPriceAtCheckout: widget.product!.productPrice * selectedQuantity,
        isFromCart: false
    );
  }

  void showLoginWarningDialog(Function() onLoginButtonPressed) {
    dialogHelper.showWarningDialog("Please! Login to Continue", "Login",
        "Cancel", onLoginButtonPressed, Colors.blueAccent, () {});
  }

  Future<void> addItemToCart() async {
    await _hiveService.addProductToCart(
        OrderProduct.fromProduct(widget.product!, selectedQuantity));
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

            Text("₹ ${widget.product?.productPrice}", style: GoogleFonts.raleway(
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

  Widget quantityButtonAndTextWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("QUANTITY: ", style: GoogleFonts.montserrat(
            color: blackColor,
            fontSize: 16,
            fontWeight: FontWeight.w600
        ),),

        const SizedBox(height: appPadding / 2,),

        IncrementAndDecrementWidget(
            selectedQuantity: selectedQuantity,
            onIncrementPressed: () {
              selectedQuantity++;
              setState(() {});
            },
            onDecrementPressed: () {
              selectedQuantity > 1
                  ? () {
                selectedQuantity--;
                setState(() {});
              }: null;
            }),
      ],
    );
  }

  addToCartAndBuyNowButtonsWidgets() {
    return Column(
      children: [
        ProductScreenButtons(
            buttonText: isProductAlreadyInCart ? "Already In Cart" : "Add To Cart!",
            onActionPerformed: () async {
              await addItemToCart();
            },
            showAddToCartButton: true,
            enabled: !isProductAlreadyInCart),

        const SizedBox(height: appPadding,),

        ProductScreenButtons(
            buttonText: "Buy Now!",
            onActionPerformed: () {
              // Buy that item
              if (user != null && user!.id.isNotEmpty) {
                Navigator.pushNamed(context, "/addressesScreen",
                    arguments: {
                      'showUIForSelectAddressScreen': true,
                      'preOrder': getPreOrder()
                    }
                );
              } else {
                showLoginWarningDialog(() {
                  Navigator.pushNamed(
                      context,
                      "/loginScreen"
                  );
                });
              }
            },
            showAddToCartButton: false),
      ],
    );
  }

  productDescription() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
              color: blackColor, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  productRatingsWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rating and Reviews",
          style: GoogleFonts.raleway(
              color: blackColor,
              fontSize: 18,
              fontWeight: FontWeight.w800),
        ),

        const SizedBox(height: appPadding,),

        if (uiRelatedProductRatings?.productRatings.ratings?.isNotEmpty ?? false)
          ProductRatingsWidget(
              context: context,
            uiRelatedProductRatings: uiRelatedProductRatings!,
            onSeeAllReviewsButtonInteraction: () {
              Navigator.pushNamed(
                  context, "/allReviewsScreen",
                  arguments: uiRelatedProductRatings?.productRatings.ratings ??
                      List.empty());
            }
          )
        else
          SizedBox(
            height: 70,
            child: Center(
              child: Text(
                "No Reviews Yet!",
                style: GoogleFonts.raleway(
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),

        const SizedBox(height: appPadding,),

        if (shouldShowWriteAReviewButton())
          GestureDetector(
            onTap: () {
              dialogHelper.showAddAReviewDialog((rating, review) {
                debugPrint("Rating: $rating");
                debugPrint("Rating: $review");
                ratingsBloc.add(AddNewProductRating(
                    getRating(rating, review), widget.product!.id));
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: darkGreyButtonBackground,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Center(
                  child: Text(
                    "Write a Review",
                    style: TextStyle(
                        color: whiteTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  bool shouldShowWriteAReviewButton() {
    if (user == null || uiRelatedProductRatings?.productRatings.ratings == null) {
      return false;
    }

    bool hasUserAlreadySubmittedReview = uiRelatedProductRatings!.productRatings.ratings!
        .any((rating) => rating.username == user!.username);

    return !hasUserAlreadySubmittedReview;
  }

  Rating getRating(int rating, String review) {
    return Rating(
        rating: rating,
        ratingComment: review,
        username: user?.name ?? "",
        ratingDate: DateTime.now().toString());
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
            uiRelatedProductRatings = state.productRatings;
            setState(() {});
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
                      }, favoriteButtonPressed: () async {
                        if (isProductAlreadyInFavourites) {
                          await _hiveService.removeItemFromFavourites(widget.product!.id);

                          isProductAlreadyInFavourites = false;
                          setState(() {});

                          _snackBarHelper.showSnackBar(
                              context, "Removed from Favourites!");
                          return;
                        }

                        await _hiveService.addProductToFavourites(widget.product!);

                        isProductAlreadyInFavourites = true;
                        setState(() {});

                        _snackBarHelper.showSnackBar(
                            context, "Added to Favourites!");
                      },
                      isInFavourite: isProductAlreadyInFavourites
                  ),

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

                  quantityButtonAndTextWidget(),

                  const SizedBox(height: appPadding * 2,),

                  addToCartAndBuyNowButtonsWidgets(),

                  const SizedBox(height: appPadding * 3,),

                  productDescription(),

                  const SizedBox(height: appPadding * 3,),

                  productRatingsWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}