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
      return ResultRepoProducts(categories: list.map((e) => e.toString()).toList());
    } catch (e) {
      log(S.current.somethingWentWrong, error: e);
      return ResultRepoProducts(errorMessage: S.current.somethingWentWrong);
    }
  }

  Future<ResultRepoProducts> getProducts() async {
    try {
      final response = await Api().dio.get('/products');
      final list = response.data as List;
      final products = list.map((e) => Product.fromMap(e)).toList();
      if(products.isEmpty) throw Exception('No data');
      return ResultRepoProducts(products: products);
    } catch (e) {
      log(S.current.somethingWentWrong, error: e);
      return ResultRepoProducts(errorMessage: S.current.somethingWentWrong);
    }
  }

  Future<ResultRepoProducts> getProductsBySort(String sort) async {
    try {
      final response = await Api().dio.get(
        '/products',
        queryParameters: {'sort': sort},
      );
      final list = response.data as List;
      final products = list.map((e) => Product.fromMap(e)).toList();
      if (products.isEmpty) throw Exception('No data');
      return ResultRepoProducts(products: products);
    } catch (e) {
      log(S.current.somethingWentWrong, error: e);
      return ResultRepoProducts(errorMessage: S.current.somethingWentWrong);
    }
  }

  Future<ResultRepoProducts> getProductsInCategory(String category) async {
    try {
      final response = await Api().dio.get('/products/category/$category');
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

  List<Product>? products;
  List<String>? categories;
  String? errorMessage;
}
