import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:sclp_final/generated/l10n.dart';
import 'package:sclp_final/repo/repo_settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? _locale;

  final _localesDropdown = [
    DropdownMenuItem(value: 'ru_RU', child: Text(S.current.russian)),
    DropdownMenuItem(value: 'en', child: Text(S.current.english))
  ];

  @override
  void initState() {
    _locale = Intl.getCurrentLocale();
    super.initState();
  }

  void _localeChanged(value) {
    if (value == 'ru_RU') {
      S.load(const Locale('ru', 'RU'));
    } else if (value == 'en') {
      S.load(const Locale('en'));
    }
    _locale = value;
    setState(() {});

    final repoSettings = Provider.of<RepoSettings>(context, listen: false);
    repoSettings.saveLocale(value!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${S.of(context).language}: "),
              DropdownButton(
                value: _locale,
                items: _localesDropdown,
                onChanged: _localeChanged,
              )
            ],
          )
        ],
      ),
    );
  }
}
