part of 'products_bloc.dart';

abstract class ProductsBlocEvent {}

class EventProductsLoad extends ProductsBlocEvent {
  EventProductsLoad({
    required this.repo,
    this.category,
    this.sort = 'asc',
    this.rate,
  });
  final RepoProducts repo;
  final double? rate;
  final String? category;
  final String sort;
}
