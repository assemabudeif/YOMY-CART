import 'package:yomy_cart/data/remote/home_page_api.dart';
import 'package:yomy_cart/data/remote/productcategorypage.dart';
import 'package:yomy_cart/data/remote/store_page_api.dart';

import 'auth_api_services.dart';
import 'brand_page_api.dart';
import 'product_details_page_api.dart';
import 'product_page_api.dart';
import 'store_offer_page_api.dart';

class ApiServices {
  ApiServices._instance();
  static final ApiServices instance = ApiServices._instance();

  AuthApiServices authApiServices() => AuthApiServices.instance;

  HomePageApi homePageApi() => HomePageApi.instance;

  ProductCategoryPageApi productCategoryPageApi() =>
      ProductCategoryPageApi.instance;

  StorePageApi storePageApi() => StorePageApi.instance;

  ProductPageApi productPageApi() => ProductPageApi.instance;

  StoreOfferPageApi storeOfferPageApi() => StoreOfferPageApi.instance;

  BrandPageApi brandPageApi() => BrandPageApi.instance;

  ProductDetailsPageAPI productDetailsPageApi() =>
      ProductDetailsPageAPI.instance;
}
