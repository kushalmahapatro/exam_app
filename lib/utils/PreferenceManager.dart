import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  Future<bool> setCountryCodePrefs(String countryCode) async {
    SharedPreferences prefs = await _prefs;
    bool result = await prefs.setString("country", countryCode ?? "");
    return result;
  }

  Future<String> getCountryCodePrefs() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString("country") ?? "";
  }

  Future<bool>setuserLoggedIn(bool login) async {
    SharedPreferences prefs = await _prefs;
    bool result = await prefs.setBool("login", login ?? false);
    return result;
  }

  Future<bool> getUserLogInStatus () async {
    SharedPreferences prefs = await _prefs;
    return prefs.getBool("login") ?? false;
  }

  Future<bool> setUserId(String userId) async {
    SharedPreferences prefs = await _prefs;
    bool result = await prefs.setString("user_id", userId ?? "");
    return result;
  }

  Future<String> getUserId () async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString("user_id") ?? "";
  }

  Future<bool> setUserName(String userName) async {
    SharedPreferences prefs = await _prefs;
    bool result = await prefs.setString("user_name", userName ?? "");
    return result;
  }

  Future<String> getUserName () async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString("user_name") ?? "";
  }

  Future<bool> clearPreferences () async {
    SharedPreferences prefs = await _prefs;
    return prefs.clear();
  }
}
