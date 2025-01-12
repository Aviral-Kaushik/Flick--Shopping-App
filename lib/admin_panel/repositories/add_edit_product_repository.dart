import 'package:flick/models/Product.dart';
import 'package:flick/services/firebase_services.dart';
import 'package:flick/services/storage/storage_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tuple/tuple.dart';

class AddEditProductRepository {

  final FirebaseServices firebaseServices;
  final StorageService storageService;

  AddEditProductRepository(this.firebaseServices, this.storageService);

  Future<Tuple3<bool, String, List<String>>> uploadProductImages(
      String sellerName, String productName, List<XFile> productImages) async {
    bool hasErrorOccurred = false;
    String errorMessage = '';
    List<String> imagesURLs = [];

    await storageService.uploadImage(sellerName, productName, productImages, (List<String> imageUrls) {
      imagesURLs = imageUrls;
    }, () {
      hasErrorOccurred = true;
    });

    return Tuple3(hasErrorOccurred, errorMessage, imagesURLs);
  }

  Future<Tuple2<bool, String>> storeProduct(Product product) async {
    bool hasErrorOccurred = false;
    String errorMessage = '';

    await firebaseServices.createNewProduct(product).then((value) {
    }).catchError((error) {
      hasErrorOccurred = true;
    });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<Tuple2<bool, String>> updateProduct(Product product) async {
    bool hasErrorOccurred = false;
    String errorMessage = '';

    await firebaseServices.updateProduct(product).then((value) {
    }).catchError((error) {
      hasErrorOccurred = true;
    });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<bool> deleteImages(List<String> productImagesURLs) async {
    for (String imageURL in productImagesURLs) {
      bool imageDeletionResponse = await storageService.deleteImages(imageURL);

      if (!imageDeletionResponse) {
        return false;
      }
    }

    return true;
  }

}