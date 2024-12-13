import 'package:flick/admin_panel/blocs/products/products_event.dart';
import 'package:flick/admin_panel/blocs/products/products_state.dart';
import 'package:flick/admin_panel/repositories/products_repository.dart';
import 'package:flick/models/Product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository productsRepository;

  ProductsBloc(this.productsRepository) : super(ProductInitial()) {

    on<FetchAllProducts>((event, emit) async {
      emit(const ProductLoading("Please Wait! Fetching Products"));

      Tuple3<List<Product>, bool, String> productsResponse =
          await productsRepository.fetchAllProduct();

      if (productsResponse.item2) {
        emit(ProductsError(
            "Cannot fetch products at this moment: ${productsResponse.item3}"));
      }

      emit(FetchedAllProducts(productsResponse.item1));
    });

    on<SearchProducts>((event, emit) async {
      List<Product> filteredProducts =
          await productsRepository.searchProduct(event.query);

      emit(FetchedAllProducts(filteredProducts));
    });

    on<EditProduct>((event, emit) async {
      emit(const ProductLoading("Updating User! Please wait"));

      Tuple2<bool, String> userUpdateResponse =
          await productsRepository.editProduct(event.productToBeUpdated);

      if (userUpdateResponse.item1) {
        emit(const ProductEditedSuccessfully());
      }

      emit(ProductsError(
          "Cannot update product at this moment: ${userUpdateResponse.item2}"));
    });

    on<DeleteProduct>((event, emit) async {
      emit(const ProductLoading("Deleting Product! Please Wait"));

      Tuple2<bool, String> productDeletionResponse =
          await productsRepository.deleteProduct(event.productToBeDeleted);

      if (productDeletionResponse.item1) {
        emit(const ProductDeletedSuccessfully());
      }

      emit(ProductsError(
          "Cannot Delete product at this moment: ${productDeletionResponse.item2}"));
    });

    on<ApplyFilter>((event, emit) async {
      emit(const ProductLoading("Applying Filter! Please Wait"));

      Tuple3<List<Product>, bool, String> filteredProducts =
          await productsRepository.applyProductsFilter(event.productFilter);

      if (filteredProducts.item2) {
        emit(ProductsError("Error: ${filteredProducts.item3}"));
      }

      emit(FetchedAllProducts(filteredProducts.item1));
    });

  }
}
