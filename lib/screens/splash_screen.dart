import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sclp_final/constants/app_assets.dart';
import 'package:sclp_final/generated/l10n.dart';
import 'package:sclp_final/repo/repo_settings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    final repoSettings = Provider.of<RepoSettings>(context, listen: false);
    repoSettings.init().whenComplete(() async {
      var defaultLocale = const Locale('ru', 'RU');
      final locale = await repoSettings.readLocale();
      if (locale == 'en') {
        defaultLocale = const Locale('en');
      }

      S.load(defaultLocale).then((value) async {
        await Future.delayed(const Duration(seconds: 1));
      }).whenComplete(() {
        Navigator.of(context).pushReplacementNamed('/settings');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Image.asset(AppAssets.images.logo),
    );
  }
}
