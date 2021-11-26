import 'package:flutter/material.dart';
import 'package:shamo_ecommerce/models/user_model.dart';
import 'package:shamo_ecommerce/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _userModel;

  UserModel get userModel => _userModel;

  set userModel(UserModel userModel) {
    _userModel = userModel;
    notifyListeners();
  }

  Future<bool> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      _userModel = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );

      _userModel = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
