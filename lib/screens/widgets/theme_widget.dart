import 'package:flutter/material.dart';
import 'package:sclp_final/constants/app_themes.dart';

class _ThemeWidget extends InheritedWidget {
  const _ThemeWidget({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final ThemeWidgetState data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class ThemeWidget extends StatefulWidget {
  const ThemeWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<ThemeWidget> createState() => ThemeWidgetState();

  static ThemeData? of(BuildContext context) {
    _ThemeWidget? inherited =
        context.dependOnInheritedWidgetOfExactType<_ThemeWidget>();
    return inherited?.data.theme;
  }

  static ThemeWidgetState? instanceOf(BuildContext context) {
    _ThemeWidget? inherited =
        context.dependOnInheritedWidgetOfExactType<_ThemeWidget>();
    return inherited?.data;
  }
}

class ThemeWidgetState extends State<ThemeWidget> {
  ThemeData? _theme;
  String? _colorName;
  Color? _color;

  @override
  void initState() {
    super.initState();
  }

  ThemeData? get theme => _theme;
  String? get colorName => _colorName;
  Color? get color => _color;

  void changeThemeColor(String? name) {
    setState(() {
      _colorName = name ?? AppThemes.defaultColorName;
      _color = AppThemes.getColorWith(name: colorName);
      _theme = AppThemes.getThemeWith(name: colorName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _ThemeWidget(data: this, child: widget.child);
  }
}
