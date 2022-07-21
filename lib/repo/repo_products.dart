import 'dart:developer';

import 'package:sclp_final/generated/l10n.dart';
import 'package:sclp_final/models/product.dart';
import 'package:sclp_final/repo/api.dart';

class RepoProducts {
  Future<ResultRepoProducts> getCategories() async {
    try {
      final response = await Api().dio.get('/products/categories');
      final list = response.data as List;

      if (list.isEmpty) throw Exception('No data');
      return ResultRepoProducts(
          categories: list.map((e) => e.toString()).toList());
    } catch (e) {
      log(S.current.somethingWentWrong, error: e);
      return ResultRepoProducts(errorMessage: S.current.somethingWentWrong);
    }
  }

  Future<ResultRepoProducts> getProductsBy(
    String? category,
    String sort,
  ) async {
    try {
      var formedUrl = '';
      if (category != null && category != 'all') {
        formedUrl = '/products/category/$category?sort=$sort';
      } else {
        formedUrl = '/products?sort=$sort';
      }

      final response = await Api().dio.get(formedUrl);
      final list = response.data as List;
      final products = list.map((e) => Product.fromMap(e)).toList();
      if (products.isEmpty) throw Exception('No data');
      return ResultRepoProducts(products: products);
    } catch (e) {
      log(S.current.somethingWentWrong, error: e);
      return ResultRepoProducts(errorMessage: S.current.somethingWentWrong);
    }
  }
}

class ResultRepoProducts {
  ResultRepoProducts({this.products, this.errorMessage, this.categories});

  List<String>? categories;
  String? errorMessage;
  List<Product>? products;
}
