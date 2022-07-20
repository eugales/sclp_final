import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sclp_final/bloc/products_bloc/products_bloc.dart';
import 'package:sclp_final/models/rating.dart';
import 'package:sclp_final/repo/repo_products.dart';
import 'package:sclp_final/screens/widgets/stars_rating_widget.dart';

class ProductFilterHeaderSliver extends SliverPersistentHeaderDelegate {
  ProductFilterHeaderSliver(
      {required this.activeSort,
      required this.callbackSort,
      required this.activeRating,
      required this.callbackRating});

  String activeRating;
  String activeSort;
  void Function(String?) callbackRating;
  void Function(String?) callbackSort;
  final Map<String, Widget?> rating = {
    'all': const Text('all'),
    '2': StarsRatingWidget(
      rating: Rating(rate: 2),
      isLeading: false,
      isTrailing: false,
      size: 16,
    ),
    '3': StarsRatingWidget(
      rating: Rating(rate: 3),
      isLeading: false,
      isTrailing: false,
      size: 16,
    ),
    '4': StarsRatingWidget(
      rating: Rating(rate: 4),
      isLeading: false,
      isTrailing: false,
      size: 16,
    ),
    '5': StarsRatingWidget(
      rating: Rating(rate: 5),
      isLeading: false,
      isTrailing: false,
      size: 16,
    ),
  };

  final List<String> sort = const ['asc', 'desc'];

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  void onSortChange(BuildContext context, String? sort) {
    if (activeSort == sort) return;
    final repo = Provider.of<RepoProducts>(context, listen: false);
    BlocProvider.of<ProductsBloc>(context, listen: false).add(
      EventProductsBySort(repo: repo, sort: sort ?? activeSort),
    );

    callbackSort(sort);
  }

  void onRatingChange(BuildContext context, String? rating) {
    if (activeRating == rating) return;
    final repo = Provider.of<RepoProducts>(context, listen: false);
    if (rating == 'all') {
      BlocProvider.of<ProductsBloc>(context, listen: false)
          .add(EventProductsLoadAll(repo: repo));
    } else {
      BlocProvider.of<ProductsBloc>(context, listen: false).add(
        EventProductsByRating(repo: repo, rate: rating ?? activeRating),
      );
    }
    callbackRating(rating);
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: BoxDecoration(
        color: Theme.of(context).bottomAppBarColor,
        border: const Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton<String>(
                value: activeSort,
                items: sort.map((s) {
                  return DropdownMenuItem<String>(value: s, child: Text(s));
                }).toList(),
                onChanged: ((value) => onSortChange(context, value)),
                underline: Container(),
              ),
              DropdownButton<String>(
                value: activeRating,
                items: rating.entries.map((o) {
                  return DropdownMenuItem<String>(
                      value: o.key, child: o.value!);
                }).toList(),
                onChanged: (value) => onRatingChange(context, value),
                underline: Container(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
