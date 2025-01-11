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
      print("Product Images Uploaded Successfully");
      print("Image URLs size: ${imageUrls.length}");
      imagesURLs = imageUrls;
      for (String s in imageUrls) {
        print("URL: ${s}");
      }
    }, () {
      print("Product Images Upload Failed");
      hasErrorOccurred = true;
      errorMessage = "Product Images Upload Failed";
    });

    return Tuple3(hasErrorOccurred, errorMessage, imagesURLs);
  }

  Future<Tuple2<bool, String>> storeProduct(Product product) async {
    bool hasErrorOccurred = false;
    String errorMessage = '';

    await firebaseServices.createNewProduct(product).then((value) {
      print("Product Added Successfully");
    }).catchError((error) {
      print("Product Add Failed");
      hasErrorOccurred = true;
      errorMessage = "Product Add Failed";
    });

    return Tuple2(hasErrorOccurred, errorMessage);
  }

}