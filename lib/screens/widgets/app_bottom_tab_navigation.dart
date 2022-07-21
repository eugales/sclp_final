import 'package:flutter/material.dart';
import 'package:sclp_final/generated/l10n.dart';
import 'package:sclp_final/screens/products_screen.dart';
import 'package:sclp_final/screens/settings_screen.dart';

class AppBottomTabNavigation extends StatelessWidget {
  const AppBottomTabNavigation({Key? key, required this.currentIndex})
      : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        iconSize: 30,
        currentIndex: currentIndex,
        onTap: (value) {
          if (value == currentIndex) return;
          switch (value) {
            case 0:
              Navigator.pushReplacement(
                context,
                _buildRoute(const ProductsScreen()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                _buildRoute(const SettingsScreen()),
              );
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
