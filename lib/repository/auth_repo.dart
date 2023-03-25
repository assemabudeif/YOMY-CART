import '../data/remote/api_services.dart';
import '../models/register/register_model.dart';
import '../models/tokens/tokens_model.dart';

class AuthRepository {
  static final instance = AuthRepository._internal();
  AuthRepository._internal();
  factory AuthRepository() => instance;

  Future<TokensModel> getToken() async {
    return await ApiServices.instance.authApiServices.getToken();
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
    return await ApiServices.instance.authApiServices.register(
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
