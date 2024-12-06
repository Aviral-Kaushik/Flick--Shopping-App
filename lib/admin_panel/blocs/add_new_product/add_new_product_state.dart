abstract class AddNewProductState {

  const AddNewProductState();
}

class AddNewProductInitial extends AddNewProductState {

  const AddNewProductInitial();
}

class AddNewProductLoading extends AddNewProductState {
  final String progressMessage;

  const AddNewProductLoading(this.progressMessage);
}

class ProductImagesUploadedSuccessfully extends AddNewProductState {

  const ProductImagesUploadedSuccessfully();
}

class ProductImagesUploadFailed extends AddNewProductState {
  final String errorMessage;

  const ProductImagesUploadFailed(this.errorMessage);
}

class ProductAddedSuccessfully extends AddNewProductState {

  const ProductAddedSuccessfully();
}

class ProductAddFailed extends AddNewProductState {
  final String errorMessage;

  const ProductAddFailed(this.errorMessage);
}