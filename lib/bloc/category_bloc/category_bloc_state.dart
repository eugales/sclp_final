part of 'category_bloc.dart';

abstract class CategoryBlocState {}

class CategoryStateInitial extends CategoryBlocState {}

class CategoryStateData extends CategoryBlocState {
  CategoryStateData({required this.categories});
  final List<String> categories;
}

class CategoryStateError extends CategoryBlocState {
  CategoryStateError(this.errorMessage);
  final String errorMessage;
}
