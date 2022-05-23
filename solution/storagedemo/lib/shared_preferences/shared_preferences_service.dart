import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  late SharedPreferences _pref;
  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  void write(String key, int value) {
    _pref.setInt(key, value);
  }

  int? read(String key) {
    return _pref.getInt(key);
  }
}
