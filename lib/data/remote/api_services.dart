import 'package:yomy_cart/data/remote/home_page_api.dart';
import 'package:yomy_cart/data/remote/productcategorypage.dart';
import 'package:yomy_cart/data/remote/store_page_api.dart';

import 'auth_api_services.dart';

class ApiServices {
  ApiServices._instance();
  static final ApiServices instance = ApiServices._instance();

  AuthApiServices authApiServices() => AuthApiServices.instance;

  HomePageApi homePageApi() => HomePageApi.instance;

  StorePageApi storePageApi() => StorePageApi.instance;

  ProductCategoryPageApi productCategoryPageApi() =>
      ProductCategoryPageApi.instance;
}
