import 'package:flutter/material.dart';
import 'package:note_app/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;
  SharedPreferences? _prefs;

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    final email = _prefs!.getString('email');
    final password = _prefs!.getString('password');
    if (email != null && password != null) {
      _user = User(email: email, password: password);
      notifyListeners();
    }
  }

  Future<bool> login(String email, String password) async {
    const authenticated = true;
    if (authenticated) {
      _user = User(email: email, password: password);
      await _prefs!.setString('email', email);
      await _prefs!.setString('password', password);
      notifyListeners();
    }
    return authenticated;
  }

  void logout() async {
    _user = null;
    await _prefs!.remove('email');
    await _prefs!.remove('password');
    notifyListeners();
  }

  bool get isLoggedIn => _user != null;

  User? get user => _user;
}
