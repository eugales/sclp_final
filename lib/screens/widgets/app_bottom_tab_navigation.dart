import 'package:flutter/material.dart';
import 'package:sclp_final/generated/l10n.dart';
import 'package:sclp_final/screens/products_screen/products_screen.dart';
import 'package:sclp_final/screens/settings_screen.dart';

class AppBottomTabNavigation extends StatelessWidget {
  AppBottomTabNavigation({Key? key, required this.currentIndex})
      : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30,
      currentIndex: currentIndex,
        onTap: (value) {
          switch (value) {
            case 0:
              Navigator.pushAndRemoveUntil(context,
                  _buildRoute(const ProductsScreen()), (route) => false);
              break;
            case 1:
              Navigator.pushAndRemoveUntil(context,
                  _buildRoute(const SettingsScreen()), (route) => false);
              break;
            default:
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: S.of(context).products,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: S.of(context).settings,
          )
        ]);
  }
}

PageRouteBuilder _buildRoute(Widget screen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return screen;
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
