import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sclp_final/bloc/category_bloc/category_bloc.dart';
import 'package:sclp_final/bloc/products_bloc/products_bloc.dart';
import 'package:sclp_final/repo/api.dart';
import 'package:sclp_final/repo/repo_auth.dart';
import 'package:sclp_final/repo/repo_products.dart';
import 'package:sclp_final/repo/repo_settings.dart';

class InitialWidget extends StatelessWidget {
  const InitialWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => Api()),
        RepositoryProvider(create: (context) => RepoAuthImpl()),
        RepositoryProvider(create: (context) => RepoProducts()),
        RepositoryProvider(create: (context) => RepoSettings()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CategoryBloc>(
            create: (context) => CategoryBloc(),
          ),
          BlocProvider<ProductsBloc>(
            create: (context) => ProductsBloc(),
          )
        ],
        child: child,
      ),
    );
  }
}
