import 'package:flutter/material.dart';

class ProductCategoiesHeaderSliver extends SliverPersistentHeaderDelegate {
  ProductCategoiesHeaderSliver({
    required this.categories,
    required this.activeCategory,
    required this.callbackCategory,
  });

  String activeCategory;
  void Function(String) callbackCategory;
  final List<String> categories;

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  void onCategoryPressed(String category) {
    if (activeCategory == category) return;
    callbackCategory(category);
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

                  if (category == activeCategory) {
                    return ElevatedButton(
                      onPressed: () => onCategoryPressed(category),
                      child: Text(category),
                    );
                  }

                  return OutlinedButton(
                    onPressed: () => onCategoryPressed(category),
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
