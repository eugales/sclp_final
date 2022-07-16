import 'package:flutter/material.dart';

class AppThemes {
  static const String defaultColorName = 'blue';

  static const Map<String, int> primariesMap = <String, int>{
    'red': 4294198070,
    'pink': 4293467747,
    'purple': 4288423856,
    'deepPurple': 4284955319,
    'indigo': 4282339765,
    'blue': 4280391411,
    'lightBlue': 4278430196,
    'cyan': 4278238420,
    'teal': 4278228616,
    'green': 4283215696,
    'lightGreen': 4287349578,
    'lime': 4291681337,
    'yellow': 4294961979,
    'amber': 4294951175,
    'orange': 4294940672,
    'deepOrange': 4294924066,
    'brown': 4286141768,
    'blueGrey': 4284513675,
  };

  static Color getColorWith({required String? name}) {
    int colorInt = primariesMap[name] ?? primariesMap[defaultColorName]!;
    return Color(colorInt);
  }

  static ThemeData getThemeWith({required String? name}) {
    int colorInt = primariesMap[name] ?? primariesMap[defaultColorName]!;
    Color color = Color(colorInt);
    final colorScheme = ColorScheme.fromSeed(seedColor: color);

    return ThemeData(colorScheme: colorScheme);
  }
}
