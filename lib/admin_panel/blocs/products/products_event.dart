import 'package:flick/admin_panel/helper/ProductFilter.dart';
import 'package:flick/models/Product.dart';

abstract class ProductsEvent {
  const ProductsEvent();
}

class FetchAllProducts extends ProductsEvent {
  const FetchAllProducts();
}

class SearchProducts extends ProductsEvent {
  final String query;

  const SearchProducts(this.query);
}

class EditProduct extends ProductsEvent {
  final Product productToBeUpdated;

  const EditProduct(this.productToBeUpdated);
}

class ApplyFilter extends ProductsEvent {
  final ProductFilter productFilter;

  const ApplyFilter(this.productFilter);
}

class DeleteProduct extends ProductsEvent {
  final Product productToBeDeleted;

  const DeleteProduct(this.productToBeDeleted);
}
