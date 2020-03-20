import 'package:dio/dio.dart';
import 'package:shopcart_bloc_provider/models/authenticate_user_model.dart';
import 'package:shopcart_bloc_provider/models/create_user_model.dart';
import 'package:shopcart_bloc_provider/models/user.dart';
import 'package:shopcart_bloc_provider/settings/settings.dart';

class AccountRepository {
  Future<UserModel> authenticate(AuthenticateModel model) async {
    var url = "${Settings.apiUrl}/v1/account/login";
    Response response = await Dio().post(url, data: model);

    return UserModel.fromJson(response.data);
  }

  Future<UserModel> create(CreateUserModel model) async {
    var url = "${Settings.apiUrl}/v1/account";
    Response response = await Dio().post(url, data: model);
    
    return UserModel.fromJson(response.data);
  }
}