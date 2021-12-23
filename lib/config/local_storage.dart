import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences preferences;
  static dynamic getfromdisk(String key) {
    var value = preferences.get(key);

    if (value is List) return value.cast<String>();
    return value;
  }

  static void savetodisk<T>(String key, T content) {
    if (content == null) {
      preferences.remove(key);
    }
    ;
    if (content is String) {
      preferences.setString(key, content);
    } else if (content is bool) {
      preferences.setBool(key, content);
    } else if (content is int) {
      preferences.setInt(key, content);
    } else if (content is double) {
      preferences.setDouble(key, content);
    } else if (content is List<String>) {
      preferences.setStringList(key, content);
    }
  }
}
