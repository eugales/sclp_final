import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sclp_final/constants/app_assets.dart';
import 'package:sclp_final/generated/l10n.dart';
import 'package:sclp_final/repo/repo_settings.dart';
import 'package:sclp_final/screens/widgets/theme_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final provider = context.read<RepoSettings>().init();
    provider.then((repoSettings) async {
      // Initial loading of Locale from local repo
      var defaultLocale = const Locale('ru', 'RU');
      final locale = await repoSettings.readLocale();
      if (locale == 'en') {
        defaultLocale = const Locale('en');
      }
      S.load(defaultLocale).then((value) async {
        await Future.delayed(const Duration(seconds: 1));
      }).whenComplete(() {
        Navigator.of(context).pushReplacementNamed('/login');
      });

      // Initial loading of Theme from local repo
      repoSettings.readThemeColorName().then((colorName) {
        ThemeWidgetState? themeWidgetState = ThemeWidget.instanceOf(context);
        themeWidgetState?.changeThemeColor(colorName);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: ThemeWidget.instanceOf(context)?.color,
      alignment: Alignment.center,
      child: Image.asset(AppAssets.images.logo),
    );
  }
}
