import 'package:yomy_cart/repository/brand_page_repo.dart';
import 'package:yomy_cart/repository/personal_account_repo.dart';
import 'package:yomy_cart/repository/product_category_repo.dart';
import 'package:yomy_cart/repository/product_page_repo.dart';
import 'package:yomy_cart/repository/store_offer_page_repo.dart';
import 'package:yomy_cart/repository/strore_page_repo.dart';
import 'package:yomy_cart/repository/strore_page_search_repo.dart';

import 'Home_repo.dart';
import 'auth_repo.dart';
import 'update_personal_account_repo.dart';

class Repository {
  static final instance = Repository._internal();

  Repository._internal();

  factory Repository() => instance;

  AuthRepository authRepository() => AuthRepository.instance;

  HomeRepository homeRepository() => HomeRepository.instance;

  ProductCaegoryRepo productCategoryRepo() => ProductCaegoryRepo.instance;

  StorePageRepository storePageRepository() => StorePageRepository.instance;

  StorePageSearchRepository storePageSearchRepository() =>
      StorePageSearchRepository.instance;

  ProductPageRepository productPageRepository() =>
      ProductPageRepository.instance;

  StoreOfferPageRepository storeOfferPageRepository() =>
      StoreOfferPageRepository.instance;

  BrandPageRepository brandPageRepository() => BrandPageRepository.instance;

  PersonalAccountRepository personalAccountRepository() =>
      PersonalAccountRepository.instance;

  UpdatePersonalAccountRepository updatePersonalAccountRepository() =>
      UpdatePersonalAccountRepository.instance;
}
