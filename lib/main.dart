import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sclp_final/generated/l10n.dart';
import 'package:sclp_final/screens/settings_screen.dart';
import 'package:sclp_final/screens/splash_screen.dart';
import 'package:sclp_final/screens/widgets/initial_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InitialWidget(
      child: MaterialApp(
        title: 'Sclp Final',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => const SplashScreen(),
          '/settings': (context) => const SettingsScreen()
        },
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
