import 'package:flick/models/Product.dart';
import 'package:image_picker/image_picker.dart';

abstract class AddNewProductEvent {

  const AddNewProductEvent();
}

class AddNewProduct extends AddNewProductEvent {
  final Product product;
  final String sellerName;
  final List<XFile> localProductImages;

  AddNewProduct(this.product, this.sellerName, this.localProductImages);
}