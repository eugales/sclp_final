import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sclp_final/models/product.dart';
import 'package:sclp_final/repo/repo_products.dart';

part 'products_bloc_event.dart';
part 'products_bloc_state.dart';

class ProductsBloc extends Bloc<ProductsBlocEvent, ProductsBlocState> {
  ProductsBloc() : super(ProductsStateInitial()) {
    on<EventProductsLoad>((event, emit) async {
      emit(ProductsStateLoading());
      final result = await event.repo.getProductsBy(event.category, event.sort);
      
      if (result.errorMessage != null) {
        emit(ProductsStateError(result.errorMessage!));
        return;
      }

      if (event.rate != null) {
        final products = result.products?.where((e) {
          return e.rating?.rate?.floor() == event.rate;
        }).toList();
        emit(ProductsStateData(products: products ?? []));
        return;
      }
      
      emit(ProductsStateData(products: result.products ?? []));
    });
  }
}
