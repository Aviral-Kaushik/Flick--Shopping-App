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

      Tuple3<List<Product>, bool, String> products =
          await productsRepository.fetchAllProduct();
    });

    on<SearchProducts>((event, emit) async {
      emit(const ProductLoading("Searching...."));

      List<Product> products =
          await productsRepository.searchProduct(event.query);

      emit(FetchedAllProducts(products));
    });

    on<EditProduct>((event, emit) async {
      emit(const ProductLoading("Updating User! Please wait"));

      Tuple2<bool, String> isUserUpdatedSuccessfully =
          await productsRepository.editProduct(event.productToBeUpdated);
    });

    on<DeleteProduct>((event, emit) async {
      emit(const ProductLoading("Deleting Product! Please Wait"));

      Tuple2<bool, String> isProductDeletedSuccessfully =
          await productsRepository.deleteProduct(event.productToBeDeleted);
    });

  }
}
