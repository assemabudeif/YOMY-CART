import 'package:yomy_cart/models/Store_page/store_page_error400_model.dart';
import 'package:yomy_cart/models/Store_page/store_page_success_model.dart';

import '../../../models/Store_page/store_page_error_model.dart';

abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class GetShopPageLoadingState extends CategoriesState {}

class GetShopPageSuccessState extends CategoriesState {
  final StorePageSuccessModel storePageSuccessModel;

  GetShopPageSuccessState(this.storePageSuccessModel);
}

class GetShopPageErrorState extends CategoriesState {
  final StorePageErrorModel storePageErrorModel;

  GetShopPageErrorState(this.storePageErrorModel);
}

class GetShopPageError400State extends CategoriesState {
  final StorePageError400Model storePageError400Model;

  GetShopPageError400State(this.storePageError400Model);
}

class GetProductCategoryPageLoadingState extends CategoriesState {}

class GetProductCategoryPageSuccessState extends CategoriesState {}

class GetProductCategoryPageErrorState extends CategoriesState {}

class GetProductCategoryPageError400State extends CategoriesState {}
