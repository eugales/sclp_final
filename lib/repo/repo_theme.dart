import 'package:shared_preferences/shared_preferences.dart';

class RepoTheme {
  SharedPreferences? prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool?> saveThemeName(String themeName) async {
    return prefs?.setString('themeName', themeName);
  }

  Future<String?> readThemeName() async {
    return prefs?.getString('themeName');
  }
}
