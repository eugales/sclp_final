import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sclp_final/repo/api.dart';
import 'package:sclp_final/repo/repo_auth.dart';
import 'package:sclp_final/repo/repo_settings.dart';
import 'package:sclp_final/repo/repo_theme.dart';
import 'package:provider/provider.dart';

class InitialWidget extends StatelessWidget {
  const InitialWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => Api()),
        RepositoryProvider(create: (context) => RepoAuthImpl()),
        RepositoryProvider(create: (context) => RepoSettings()),
        RepositoryProvider(create: (context) => RepoTheme())
      ],
      child: MultiProvider(
        providers: [
          Provider(create: (context) => Provider.of<RepoTheme>(context, listen: false)..init(),)
        ],
        child: child,
      ),
    );
  }
}
