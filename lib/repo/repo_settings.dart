import 'package:shared_preferences/shared_preferences.dart';

class RepoSettings {
  SharedPreferences? prefs;

  Future<RepoSettings> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool?> saveLocale(String locale) async {
    return prefs?.setString('locale', locale);
  }

  Future<String?> readLocale() async {
    return prefs?.getString('locale');
  }

  Future<bool?> saveThemeColorName(String themeName) async {
    return prefs?.setString('themeColorName', themeName);
  }

  Future<String?> readThemeColorName() async {
    return prefs?.getString('themeColorName');
  }
}
