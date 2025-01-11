import 'package:ezy_course/repository/auth_repo.dart';
import 'package:ezy_course/utils/local_storage.dart';
import 'package:flutter/material.dart';

class LoginViewmodel extends ChangeNotifier {
  final AuthRepo repo;
  LoginViewmodel(this.repo);
  bool _isLoading = false;

  set isLoading(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  Future<bool> submit(
      {required String email,
      required String password,
      bool isChecked = false}) async {
    isLoading = true;
    var loginModel = await repo.login(
      {
        "email": email,
        "password": password,
        "app_token": "",
      },
    );
    isLoading = false;
    if (loginModel?.token != null) {
      if (isChecked) {
        LocalStorage.saveCredentials(email, password);
      }
      LocalStorage.saveAccessToken(loginModel!.token!);
      return true;
    } else {
      return false;
    }
  }
}
