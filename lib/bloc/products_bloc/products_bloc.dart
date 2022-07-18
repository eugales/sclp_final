import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sclp_final/models/product.dart';
import 'package:sclp_final/repo/repo_products.dart';

part 'products_bloc_event.dart';
part 'products_bloc_state.dart';

class ProductsBloc extends Bloc<ProductsBlocEvent, ProductsBlocState> {
  ProductsBloc() : super(ProductsStateInitial()) {
    on<ProductsBlocEvent>((event, emit) {

    });

    on<EventProductsLoadAll>((event, emit) async {
      final result = await event.repo.getProducts();
      if (result.errorMessage != null) {
        emit(ProductsStateError(result.errorMessage!));
        return;
      }
      emit(ProductsStateData(products: result.products ?? []));
    });

    on<EventProductsBySort>((event, emit) async {
      final result = await event.repo.getProductsBySort(event.sort);
      if (result.errorMessage != null) {
        emit(ProductsStateError(result.errorMessage!));
        return;
      }
      emit(ProductsStateData(products: result.products ?? []));
    });

    on<EventProductsInCategory>((event, emit) async {
      final result = await event.repo.getProductsInCategory(event.category);
      if (result.errorMessage != null) {
        emit(ProductsStateError(result.errorMessage!));
        return;
      }
      emit(ProductsStateData(products: result.products ?? []));
    });

    on<EventProductsLoadCategories>((event, emit) async {
      final result = await event.repo.getCategories();
      if (result.errorMessage != null) {
        emit(ProductsStateError(result.errorMessage!));
        return;
      }
      emit(ProductsStateCategoriesData(categories: result.categories ?? []));
    });
  }
}
