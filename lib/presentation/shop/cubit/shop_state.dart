import 'package:yomy_cart/models/product_details/product_details_error_400_model.dart';
import 'package:yomy_cart/models/product_details/product_details_error_model.dart';
import 'package:yomy_cart/models/product_details/product_details_success_model.dart';

import '../../../models/product_details/product_details_model.dart';

abstract class ShopState {}

class ShopInitial extends ShopState {}

class ChangeButtonState extends ShopState {}

class ChangeFavoriteState extends ShopState {}

class ChangeCarouselIndexState extends ShopState {}

class ChangePriceIndicatorState extends ShopState {}

class GetProductDetailsLoadingState extends ShopState {}

class GetProductDetailsSuccessState extends ShopState {
  final ProductDetailsSuccessModel productDetailsSuccessModel;

  GetProductDetailsSuccessState(this.productDetailsSuccessModel);
}

class GetProductDetailsErrorState extends ShopState {
  final ProductDetailsErrorModel productDetailsErrorModel;

  GetProductDetailsErrorState(this.productDetailsErrorModel);
}

class GetProductDetailsError400State extends ShopState {
  final ProductDetailsError400Model productDetailsError400Model;

  GetProductDetailsError400State(this.productDetailsError400Model);
}
