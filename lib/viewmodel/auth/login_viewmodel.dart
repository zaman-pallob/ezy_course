import 'package:ezy_course/repository/auth_repo.dart';
import 'package:flutter/material.dart';

class LoginViewmodel extends ChangeNotifier {
  final AuthRepo repo;
  LoginViewmodel(this.repo);
}
