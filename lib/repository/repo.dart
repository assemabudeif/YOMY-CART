import 'package:yomy_cart/models/register/register_model.dart';

import '../data/remote/api_services.dart';
import '../models/tokens/tokens_model.dart';

class Repository {
  static final instance = Repository._internal();
  Repository._internal();
  factory Repository() => instance;

  Future<TokensModel> getToken() async {
    return await ApiServices.instance.getToken();
  }

  Future<RegisterModel> register({
    required String firstName,
    required String lastName,
    required String email,
    required String userName,
    required String mobile,
    required String password,
    required String confirmPassword,
  }) async {
    return await ApiServices.instance.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      userName: userName,
      mobile: mobile,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
