import 'package:flutter/material.dart';
import 'package:sclp_final/models/rating.dart';
import 'package:sclp_final/screens/products_screen.dart';
import 'package:sclp_final/screens/widgets/stars_rating_widget.dart';

class ProductFilterHeaderSliver extends SliverPersistentHeaderDelegate {

  final List<String> sort = const ['asc', 'desc'];
  final Map<double?, Widget?> rating = {
    null: const Text('all'),
    1: StarsRatingWidget(
      rating: Rating(rate: 1),
      isLeading: false,
      isTrailing: false,
      size: 16,
    ),
    2: StarsRatingWidget(
      rating: Rating(rate: 2),
      isLeading: false,
      isTrailing: false,
      size: 16,
    ),
    3: StarsRatingWidget(
      rating: Rating(rate: 3),
      isLeading: false,
      isTrailing: false,
      size: 16,
    ),
    4: StarsRatingWidget(
      rating: Rating(rate: 4),
      isLeading: false,
      isTrailing: false,
      size: 16,
    ),
    5: StarsRatingWidget(
      rating: Rating(rate: 5),
      isLeading: false,
      isTrailing: false,
      size: 16,
    ),
  };

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final state = ProductsScreen.of(context);
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
                value: ProductsScreen.stateWidget(context)?.activeSort,
                items: sort.map((s) {
                  return DropdownMenuItem<String>(value: s, child: Text(s));
                }).toList(),
                onChanged: ((value) => state?.setActiveSort(value ?? sort.first)),
                underline: Container(),
              ),
              DropdownButton<double>(
                value: ProductsScreen.stateWidget(context)?.activeRate,
                items: rating.entries.map((o) {
                  return DropdownMenuItem<double>(
                      value: o.key, child: o.value!);
                }).toList(),
                onChanged: (value) => state?.setActiveRate(value),
                underline: Container(),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
