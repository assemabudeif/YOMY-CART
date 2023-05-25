import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/product_details/product_details_error_400_model.dart';
import '../../../models/product_details/product_details_error_model.dart';
import '../../../models/product_details/product_details_success_model.dart';
import '../../../repository/repo.dart';
import '../../resources/routes_manager.dart';
import '/models/shop_category_model.dart';
import '/presentation/resources/assets_manager.dart';
import '/presentation/shop/cubit/shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  static ShopCubit get(BuildContext context) => BlocProvider.of(context);

  List<ShopCategoryModel> model = [
    ShopCategoryModel(
      name: 'All',
      image: ImageAssets.allIcon,
      isTaped: true,
    ),
    ShopCategoryModel(
      name: 'Drinks',
      image: ImageAssets.drinksImg,
      isTaped: false,
    ),
    ShopCategoryModel(
      name: 'Sweets',
      image: ImageAssets.sweetsIcon,
      isTaped: false,
    ),
    ShopCategoryModel(
      name: 'Cleaners',
      image: ImageAssets.cleaningProductIcon,
      isTaped: false,
    ),
    ShopCategoryModel(
      name: 'Foods',
      image: ImageAssets.foodsIcon,
      isTaped: false,
    ),
    ShopCategoryModel(
      name: 'Sweets',
      image: ImageAssets.sweetsIcon,
      isTaped: false,
    ),
  ];

  bool isFavorite = false;
  bool isProducts = false;
  bool isOffers = true;

  void changeButton(String type) {
    if (type == 'products') {
      isProducts = true;
      isOffers = false;
    }
    if (type == 'offers') {
      isProducts = false;
      isOffers = true;
    }

    emit(ChangeButtonState());
  }

  void changeFavorite() {
    isFavorite = !isFavorite;

    emit(ChangeFavoriteState());
  }

  List<String> images = [
    for (int i = 0; i < 5; i++) ImageAssets.muskMarket,
  ];

  int activeIndex = 0;

  void changeCarouselIndex(int index) {
    activeIndex = index;
    emit(ChangeCarouselIndexState());
  }

  var controller = CarouselController();

  List<ShopCategoryModel> filterModel = [
    ShopCategoryModel(
      name: 'Drinks',
      image: ImageAssets.drinksImg,
      isTaped: true,
    ),
    ShopCategoryModel(
      name: 'Sweets',
      image: ImageAssets.sweetsIcon,
      isTaped: false,
    ),
    ShopCategoryModel(
      name: 'Cleaners',
      image: ImageAssets.cleaningProductIcon,
      isTaped: false,
    ),
    ShopCategoryModel(
      name: 'Foods',
      image: ImageAssets.foodsIcon,
      isTaped: false,
    ),
    ShopCategoryModel(
      name: 'Sweets',
      image: ImageAssets.sweetsIcon,
      isTaped: false,
    ),
  ];
  RangeValues priceValues = const RangeValues(500, 800);

  void changePriceIndicator(value) {
    priceValues = value;
    emit(ChangePriceIndicatorState());
  }

  late ProductDetailsSuccessModel productDetailsSuccessModel;

  late ProductDetailsError400Model productDetailsError400Model;
  late ProductDetailsErrorModel productDetailsErrorModel;

  Future<void> getProductDetailsButtonPressed(
      BuildContext context, int id) async {
    emit(GetProductDetailsLoadingState());
    final response =
        await Repository.instance.productPageRepository().getProductDetails(id);

    if (response is ProductDetailsSuccessModel) {
      log(response.toString());
      productDetailsSuccessModel = response;

      emit(GetProductDetailsSuccessState(response));
    } else if (response is ProductDetailsErrorModel) {
      log('Error: ${response.toString()}');
      if (response.messages![0] == "Authentication Failed.") {
        log('Error: ${response.messages}');

        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginRoute, (route) => false);
      }
      productDetailsErrorModel = response;
      emit(GetProductDetailsErrorState(response));
    } else if (response is ProductDetailsError400Model) {
      log(response.detail.toString());
      productDetailsError400Model = response;
      emit(GetProductDetailsError400State(response));
    }
  }
}
