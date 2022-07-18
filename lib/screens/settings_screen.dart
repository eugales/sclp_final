import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sclp_final/constants/app_themes.dart';

import 'package:sclp_final/generated/l10n.dart';
import 'package:sclp_final/repo/repo_settings.dart';
import 'package:sclp_final/screens/widgets/app_bottom_tab_navigation.dart';
import 'package:sclp_final/screens/widgets/theme_widget.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? _locale;
  late List<DropdownMenuItem> _localesDropdown;
  late List<DropdownMenuItem<String>> _themeColorsDropdown;

  @override
  void initState() {
    _locale = Intl.getCurrentLocale();

    _localesDropdown = [
      DropdownMenuItem(value: 'ru_RU', child: Text(S.current.russian)),
      DropdownMenuItem(value: 'en', child: Text(S.current.english))
    ];

    _themeColorsDropdown = AppThemes.primariesMap.keys.map((colorName) {
      return DropdownMenuItem<String>(value: colorName, child: Text(colorName));
    }).toList();

    super.initState();
  }

  void _localeChanged(value) {
    if (value == 'ru_RU') {
      S.load(const Locale('ru', 'RU'));
    } else if (value == 'en') {
      S.load(const Locale('en'));
    }
    setState(() {
      _locale = value;
    });
    context.read<RepoSettings>().saveLocale(value!);
  }

  void _themeColorChanged(String? value) {
    if (value == null) return;
    ThemeWidget.instanceOf(context)?.changeThemeColor(value);
    context.read<RepoSettings>().saveThemeColorName(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: AppBottomTabNavigation(currentIndex: 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${S.of(context).language}: "),
              DropdownButton(
                alignment: Alignment.center,
                value: _locale,
                items: _localesDropdown,
                onChanged: _localeChanged,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${S.of(context).appTheme}: "),
              DropdownButton<String>(
                value: ThemeWidget.instanceOf(context)?.colorName,
                items: _themeColorsDropdown,
                onChanged: _themeColorChanged,
                alignment: Alignment.center,
              )
            ],
          )
        ],
      ),
    );
  }
}
