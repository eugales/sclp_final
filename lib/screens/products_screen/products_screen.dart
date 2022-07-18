import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sclp_final/bloc/products_bloc/products_bloc.dart';
import 'package:sclp_final/generated/l10n.dart';
import 'package:sclp_final/models/product.dart';
import 'package:sclp_final/screens/products_screen/widgets/products_list_view.dart';
import 'package:sclp_final/screens/widgets/app_bottom_tab_navigation.dart';

class ProductsScreen extends StatefulWidget {
  static const routeName = '/products';
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).products),
      ),
      body: BlocBuilder<ProductsBloc, ProductsBlocState>(
        builder: (context, state) {
          if (state is ProductsStateData) {
            products = state.products;
            return ProductsListView(products: products);
          }

          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: AppBottomTabNavigation(currentIndex: 0),
    );
  }
}