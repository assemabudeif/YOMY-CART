import 'auth_repo.dart';

class Repository {
  static final instance = Repository._internal();
  Repository._internal();
  factory Repository() => instance;

  AuthRepository authRepository() => AuthRepository.instance;
}
