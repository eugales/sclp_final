part of 'products_bloc.dart';

abstract class ProductsBlocEvent {}

class EventProductsLoadAll extends ProductsBlocEvent {
  EventProductsLoadAll({required this.repo});
  final RepoProducts repo;
}

class EventProductsBySort extends ProductsBlocEvent {
  EventProductsBySort({required this.repo, required this.sort});
  final RepoProducts repo;
  final String sort;
}

class EventProductsByRating extends ProductsBlocEvent {
  EventProductsByRating({required this.repo, required this.rate});
  final RepoProducts repo;
  final String rate;
}

class EventProductsLoadInCategory extends ProductsBlocEvent {
  EventProductsLoadInCategory({required this.repo, required this.category});
  final RepoProducts repo;
  final String category;
}
