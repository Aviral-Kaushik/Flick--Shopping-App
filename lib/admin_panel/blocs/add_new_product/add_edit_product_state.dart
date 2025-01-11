abstract class AddEditProductState {

  const AddEditProductState();
}

class AddNewProductInitial extends AddEditProductState {

  const AddNewProductInitial();
}

class AddNewProductLoading extends AddEditProductState {
  final String progressMessage;

  const AddNewProductLoading(this.progressMessage);
}

class ProductImagesUploadedSuccessfully extends AddEditProductState {

  const ProductImagesUploadedSuccessfully();
}

class ProductImagesUploadFailed extends AddEditProductState {
  final String errorMessage;

  const ProductImagesUploadFailed(this.errorMessage);
}

class ProductAddedSuccessfully extends AddEditProductState {

  const ProductAddedSuccessfully();
}

class ProductAddFailed extends AddEditProductState {
  final String errorMessage;

  const ProductAddFailed(this.errorMessage);
}