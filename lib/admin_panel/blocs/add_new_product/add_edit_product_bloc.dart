import 'package:flick/admin_panel/blocs/add_new_product/add_edit_product_event.dart';
import 'package:flick/admin_panel/blocs/add_new_product/add_edit_product_state.dart';
import 'package:flick/admin_panel/repositories/add_edit_product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

class AddEditProductBloc extends Bloc<AddEditProductEvent, AddEditProductState> {

  final AddEditProductRepository addEditProductRepository;

  AddEditProductBloc(this.addEditProductRepository) : super(const AddNewProductInitial()) {
    on<AddNewProduct>((event, emit) async {
      emit(const AddNewProductLoading("Please Wait! Uploading Images..."));

      Tuple3<bool, String, List<String>> uploadProductImagesResult =
          await addEditProductRepository.uploadProductImages(
              event.product.productName, event.sellerName, event.localProductImages);

      if (uploadProductImagesResult.item1) {
        emit(ProductImagesUploadFailed(uploadProductImagesResult.item2));
      } else {
        emit(const ProductImagesUploadedSuccessfully());

        event.product.productImages = uploadProductImagesResult.item3;

        Tuple2<bool, String> addNewProductResult =
            await addEditProductRepository.storeProduct(event.product);

        if (addNewProductResult.item1) {
          emit(ProductAddFailed(addNewProductResult.item2));
        } else {
          emit(const ProductAddedSuccessfully());
        }
      }
    });
  }

}