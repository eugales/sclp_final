import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sclp_final/bloc/category_bloc/category_bloc.dart';
import 'package:sclp_final/bloc/products_bloc/products_bloc.dart';
import 'package:sclp_final/constants/app_styles.dart';
import 'package:sclp_final/generated/l10n.dart';
import 'package:sclp_final/models/product.dart';
import 'package:sclp_final/screens/product_details_screen.dart';
import 'package:sclp_final/screens/widgets/product_categories_header_sliver.dart';
import 'package:sclp_final/screens/widgets/app_bottom_tab_navigation.dart';
import 'package:sclp_final/screens/widgets/stars_rating_widget.dart';

part "widgets/product_list_item.dart";

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  static const routeName = '/products';

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String activeCategory = 'all';

  void setActiveCategory(String selectedCategory) {
    setState(() {
      activeCategory = selectedCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomTabNavigation(currentIndex: 0),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            excludeHeaderSemantics: true,
            floating: true,
            pinned: true,
            title: Text(S.of(context).products),
          ),
          BlocBuilder<CategoryBloc, CategoryBlocState>(
            builder: (context, state) {
              if (state is CategoryStateData) {
                return SliverPersistentHeader(
                  floating: false,
                  pinned: true,
                  delegate: ProductCategoiesHeaderSliver(
                      categories: ['all', ...state.categories],
                      activeCategory: activeCategory,
                      callback: setActiveCategory),
                );
              }

              return SliverFillRemaining(
                child: Center(
                  child: Text(S.of(context).noData),
                ),
              );
            },
          ),
          BlocBuilder<ProductsBloc, ProductsBlocState>(
            builder: (context, state) {
              if (state is ProductsStateLoading) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (state is ProductsStateData) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final int itemIndex = index ~/ 2;
                      final Widget widget;
                      if (index.isEven) {
                        widget =
                            ProductListItem(product: state.products[itemIndex]);
                      } else {
                        widget = const SizedBox(height: 8);
                      }
                      return widget;
                    },
                    semanticIndexCallback: (Widget _, int index) {
                      return index.isEven ? index ~/ 2 : null;
                    },
                    childCount: state.products.length * 2 - 1,
                  ),
                );
              }

              return SliverFillRemaining(
                child: Center(
                  child: Text(S.of(context).noData),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
