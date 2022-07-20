part of 'category_bloc.dart';

abstract class CategoryBlocEvent {}

class EventLoadCategories extends CategoryBlocEvent {
  EventLoadCategories({required this.repo});
  final RepoProducts repo;
}
