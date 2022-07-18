part of 'products_bloc.dart';

abstract class ProductsBlocState {}

class ProductsStateInitial extends ProductsBlocState {}

class ProductsStateLoading extends ProductsBlocState {}

class ProductsStateData extends ProductsBlocState {
  ProductsStateData({
    required this.products,
  });
  final List<Product> products;
}

class ProductsStateCategoriesData extends ProductsBlocState {
  ProductsStateCategoriesData({
    required this.categories,
  });
  final List<String> categories;
}

class ProductsStateError extends ProductsBlocState {
  ProductsStateError(this.error);

  final String error;

}
