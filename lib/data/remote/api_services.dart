import 'auth_api_services.dart';

class ApiServices {
  ApiServices._instance();
  static final ApiServices instance = ApiServices._instance();

  AuthApiServices authApiServices() => AuthApiServices.instance;
}
