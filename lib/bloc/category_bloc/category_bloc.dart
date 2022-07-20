
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sclp_final/repo/repo_products.dart';

part 'category_bloc_event.dart';
part 'category_bloc_state.dart';

class CategoryBloc extends Bloc<CategoryBlocEvent, CategoryBlocState> {
  CategoryBloc() : super(CategoryStateInitial()) {
    on<EventLoadCategories>((event, emit) async {
      final result = await event.repo.getCategories();
      if (result.errorMessage != null) {
        emit(CategoryStateError(result.errorMessage!));
        return;
      }
      emit(CategoryStateData(categories: result.categories!));
    });
  }
}
