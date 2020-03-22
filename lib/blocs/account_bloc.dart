import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopcart_bloc_provider/models/authenticate_user_model.dart';
import 'package:shopcart_bloc_provider/models/create_user_model.dart';
import 'package:shopcart_bloc_provider/models/user.dart';
import 'package:shopcart_bloc_provider/repositories/account_repository.dart';
import 'package:shopcart_bloc_provider/settings/settings.dart';

class AccountBloc extends ChangeNotifier {
  var user = new UserModel();

  AccountBloc() {
    user = null;
    loadUser();
  }

  Future<UserModel> authenticate(AuthenticateModel model) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final AccountRepository repository = new AccountRepository();

      var res = await repository.authenticate(model);

      user = res;
      await prefs.setString('user', jsonEncode(user));

      return res;
    } catch(err) {
      user = null;
      return null;
    }
  }

  Future<UserModel> create(CreateUserModel model) async {
    try {
      final AccountRepository repository = new AccountRepository();

      var res = await repository.create(model);

      return res;
    } catch(err) {
      user = null;
      return null;
    }
  }

  logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', null);
    user = null;
    notifyListeners();
  }

  Future loadUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString('user');
    if (userData != null) {
      var res = UserModel.fromJson(jsonDecode(userData));
      Settings.user = res;
      user = res;
    }
  }
}