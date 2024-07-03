import 'package:flick/models/Product.dart';

abstract class ProductsState {
  const ProductsState();
}

class ProductInitial extends ProductsState {}

class ProductLoading extends ProductsState {
  final String progressMessage;

  const ProductLoading(this.progressMessage);
}

class FetchedAllProducts extends ProductsState {
  final List<Product> products;

  const FetchedAllProducts(this.products);
}

class ProductsError extends ProductsState {
  final String errorMessage;

  const ProductsError(this.errorMessage);
}

class ProductEditedSuccessfully extends ProductsState {
  const ProductEditedSuccessfully();
}

class ProductDeletedSuccessfully extends ProductsState {
  const ProductDeletedSuccessfully();
}
