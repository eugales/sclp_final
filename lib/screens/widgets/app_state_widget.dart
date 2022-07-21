import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppStateWidget extends InheritedWidget {
  AppStateWidget({super.key, required super.child});

  String activeCategory = 'all';
  double? activeRate;
  String activeSort = 'asc';

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
