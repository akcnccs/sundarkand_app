import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static SpUtil? _instance;
  static SharedPreferences? _preferences;

  static Future<SpUtil> getInstance() async {
    if (_instance == null) {
      _instance = SpUtil();
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  Future<bool>? putString(String key, String value) {
    return _preferences?.setString(key, value);
  }

  String getString(String key, {String defValue = ''}) {
    return _preferences?.getString(key) ?? defValue;
  }

  Future<bool>? putBool(String key, bool value) {
    return _preferences?.setBool(key, value);
  }

  bool getBool(String key, {bool defValue = false}) {
    return _preferences?.getBool(key) ?? defValue;
  }
}
