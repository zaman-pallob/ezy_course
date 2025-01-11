import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final LocalStorage _localStorage = LocalStorage._internal();
  static late SharedPreferences preferences;
  factory LocalStorage() {
    return _localStorage;
  }
  LocalStorage._internal();

  static initialize() async {
    preferences = await SharedPreferences.getInstance();
  }

  static saveAccessToken(String token) {
    preferences.setString("Token", "Bearer $token");
  }

  static String getAccessToken() {
    return preferences.getString("Token") ?? "";
  }

  static saveCredentials(String email, String pass) {
    preferences.setString("email", email);
    preferences.setString("pass", pass);
  }

  static String getEmail() {
    return preferences.getString("email") ?? "";
  }

  static String getPassword() {
    return preferences.getString("pass") ?? "";
  }

  static void logoutUser() {
    preferences.setString("Token", "");
  }
}
