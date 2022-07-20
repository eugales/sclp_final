import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sclp_final/bloc/products_bloc/products_bloc.dart';
import 'package:sclp_final/repo/repo_products.dart';

class ProductCategoiesHeaderSliver extends SliverPersistentHeaderDelegate {
  ProductCategoiesHeaderSliver(
      {required this.categories,
      required this.activeCategory,
      required this.callback});

  String activeCategory;
  final List<String> categories;
  void Function(String) callback;

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  void onCategoryPressed(BuildContext context, String category) {
    
    final repo = Provider.of<RepoProducts>(context, listen: false);
    if (category == 'all') {
      BlocProvider.of<ProductsBloc>(context, listen: false)
          .add(EventProductsLoadAll(repo: repo));
    } else {
      BlocProvider.of<ProductsBloc>(context, listen: false).add(
        EventProductsLoadInCategory(repo: repo, category: category),
      );
    }
    callback(category);
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
                      onPressed: () => onCategoryPressed(context, category),
                      child: Text(category),
                    );
                  }

                  return OutlinedButton(
                    onPressed: () => onCategoryPressed(context, category),
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
