import 'package:flick/models/Product.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddEditProductEvent {

  const AddEditProductEvent();
}

class AddNewProduct extends AddEditProductEvent {
  final Product product;
  final String sellerName;
  final List<XFile> localProductImages;

  AddNewProduct(this.product, this.sellerName, this.localProductImages);
}