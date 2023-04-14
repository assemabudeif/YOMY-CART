import 'package:yomy_cart/repository/strore_page.dart';

import 'Home_repo.dart';
import 'auth_repo.dart';

class Repository {
  static final instance = Repository._internal();

  Repository._internal();

  factory Repository() => instance;

  AuthRepository authRepository() => AuthRepository.instance;

  HomeRepository homeRepository() => HomeRepository.instance;

  StorePageRepository storePageRepository() => StorePageRepository.instance;
}
