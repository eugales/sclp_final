import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:sclp_final/bloc/category_bloc/category_bloc.dart';
import 'package:sclp_final/bloc/products_bloc/products_bloc.dart';
import 'package:sclp_final/constants/app_styles.dart';
import 'package:sclp_final/generated/l10n.dart';
import 'package:sclp_final/models/product.dart';
import 'package:sclp_final/repo/repo_products.dart';
import 'package:sclp_final/screens/product_details_screen.dart';
import 'package:sclp_final/screens/widgets/app_bottom_tab_navigation.dart';
import 'package:sclp_final/screens/widgets/no_data_widget.dart';
import 'package:sclp_final/screens/widgets/product_categories_header_sliver.dart';
import 'package:sclp_final/screens/widgets/app_state_widget.dart';
import 'package:sclp_final/screens/widgets/product_fliter_header_sliver.dart';
import 'package:sclp_final/screens/widgets/stars_rating_widget.dart';

part "widgets/product_list_item.dart";

class _ProductsScreen extends InheritedWidget {
  const _ProductsScreen({required this.data, required super.child});

  final _ProductsScreenState data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class ProductsScreen extends StatefulWidget {
  static const routeName = '/products';

  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
  // ignore: library_private_types_in_public_api
  static _ProductsScreenState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_ProductsScreen>()?.data;
  }

  static AppStateWidget? stateWidget(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateWidget>();
  }
}

class _ProductsScreenState extends State<ProductsScreen> {
  void setActiveCategory(String selectedCategory) {
    setState(() {
      ProductsScreen.stateWidget(context)?.activeCategory = selectedCategory;
    });
    onFilter();
  }

  void setActiveSort(String selectedSort) {
    setState(() {
      ProductsScreen.stateWidget(context)?.activeSort = selectedSort;
    });
    onFilter();
  }

  void setActiveRate(double? selectedRate) {
    setState(() {
      ProductsScreen.stateWidget(context)?.activeRate = selectedRate;
    });
    onFilter();
  }

  void onFilter() {
    final repo = Provider.of<RepoProducts>(context, listen: false);
    BlocProvider.of<ProductsBloc>(context, listen: false).add(
      EventProductsLoad(
        repo: repo,
        category: ProductsScreen.stateWidget(context)?.activeCategory,
        sort: ProductsScreen.stateWidget(context)?.activeSort ?? '',
        rate: ProductsScreen.stateWidget(context)?.activeRate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _ProductsScreen(
      data: this,
      child: Scaffold(
        bottomNavigationBar: const AppBottomTabNavigation(currentIndex: 0),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(pinned: true, title: Text(S.of(context).products)),
            //category header
            BlocBuilder<CategoryBloc, CategoryBlocState>(
              builder: (context, state) {
                if (state is CategoryStateData) {
                  return SliverPersistentHeader(
                    floating: false,
                    pinned: true,
                    delegate: ProductCategoiesHeaderSliver(
                      categories: ['all', ...state.categories],
                    ),
                  );
                }

                return const NoDataWidget();
              },
            ),
            // filter
            SliverPersistentHeader(
              floating: false,
              pinned: true,
              delegate: ProductFilterHeaderSliver(),
            ),
            // list
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
                          widget = ProductListItem(
                            product: state.products[itemIndex],
                          );
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

                return const NoDataWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}
