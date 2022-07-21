import 'package:flutter/material.dart';
import 'package:sclp_final/screens/products_screen.dart';

class ProductCategoiesHeaderSliver extends SliverPersistentHeaderDelegate {
  ProductCategoiesHeaderSliver({
    required this.categories,
  });

  final List<String> categories;

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final filterState = ProductsScreen.stateWidget(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarColor,
          border: const Border(bottom: BorderSide(color: Colors.black12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categories.length * 2 - 1, (index) {
                if (index.isEven) {
                  final category = categories[index ~/ 2];
                  final state = ProductsScreen.of(context);

                  if (category == filterState?.activeCategory) {
                    return ElevatedButton(
                      onPressed: () {
                        if (filterState?.activeCategory == category) return;
                        state?.setActiveCategory(category);
                      },
                      child: Text(category),
                    );
                  }

                  return OutlinedButton(
                    onPressed: () {
                      if (filterState?.activeCategory == category) return;
                      state?.setActiveCategory(category);
                    },
                    style: OutlinedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Text(category),
                  );
                } else {
                  return const SizedBox(width: 16);
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
