part of 'products_bloc.dart';

@immutable
abstract class ProductsBlocEvent {}

class EventProductsLoadAll extends ProductsBlocEvent {
  EventProductsLoadAll({
    required this.repo,
  });

  final RepoProducts repo;
}

class EventProductsBySort extends ProductsBlocEvent {
  EventProductsBySort({required this.repo, required this.sort});

  final RepoProducts repo;
  final String sort;
}

class EventProductsInCategory extends ProductsBlocEvent {
  EventProductsInCategory({required this.repo, required this.category});

  final RepoProducts repo;
  final String category;
}

class EventProductsLoadCategories extends ProductsBlocEvent {
  EventProductsLoadCategories({required this.repo});

  final RepoProducts repo;
}
