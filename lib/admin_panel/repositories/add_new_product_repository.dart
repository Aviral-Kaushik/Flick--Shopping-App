import 'package:flick/models/Product.dart';
import 'package:flick/services/firebase_services.dart';
import 'package:flick/services/storage/storage_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tuple/tuple.dart';

class AddNewProductRepository {

  final FirebaseServices firebaseServices;
  final StorageService storageService;

  AddNewProductRepository(this.firebaseServices, this.storageService);

  Future<Tuple2<bool, String>> uploadProductImages(String productName,
      List<XFile> productImages) async {
    bool hasErrorOccurred = false;
    String errorMessage = '';

    return Tuple2(hasErrorOccurred, errorMessage);
  }

  Future<Tuple2<bool, String>> storeProduct(Product product) async {
    bool hasErrorOccurred = false;
    String errorMessage = '';

    return Tuple2(hasErrorOccurred, errorMessage);
  }

}