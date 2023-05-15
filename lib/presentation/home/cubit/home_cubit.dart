import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yomy_cart/models/home_page/home_page_api_error400_model.dart';

import '../../../models/home_page/home_page_api_error_model.dart';
import '../../../models/home_page/home_page_api_success_model.dart';
import '../../resources/routes_manager.dart';
import '/presentation/account/account_screen.dart';
import '/presentation/cart/cart_screen.dart';
import '/presentation/home/home_screen.dart';
import '/presentation/resources/assets_manager.dart';
import '/presentation/resources/strings_manager.dart';
import '../../../repository/repo.dart';
import '../../categories/categories_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  HomePageApiSuccessModel? homePageApiModel;
  HomePageApiErrorModel? homePageApiErrorModel;
  HomePageApiError400Model? homePageApiError404Model;

  List<String> items = [
    for (int i = 0; i < 5; i++) ImageAssets.pizzaKing,
  ];
  double indicatorIndex = 0;
  int currentIndex = 0;
  List<Items> navItems = [
    Items(
      index: 0,
      text: StringsManager.home,
      icon: ImageAssets.home,
      onPressed: () {},
    ),
    Items(
        index: 1,
        text: StringsManager.categories,
        icon: ImageAssets.categories,
        onPressed: () {}),
    Items(
      index: 2,
      text: StringsManager.cart,
      icon: ImageAssets.cart,
      onPressed: () {},
    ),
    Items(
      index: 3,
      text: StringsManager.orders,
      icon: ImageAssets.orders,
      onPressed: () {},
    ),
    Items(
      index: 4,
      text: StringsManager.setting,
      icon: ImageAssets.profile,
      onPressed: () {},
    ),
  ];

  void changeIndicatorIndex(double index) {
    emit(HomeInitial());
    indicatorIndex = index;
    emit(HomeChangeIndicatorIndexState());
  }

  Widget? pages(context, index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const CategoriesScreen();
      case 2:
        return Container();
      case 3:
        return Container();
      case 4:
        return const AccountScreen();
    }
    return null;
  }

  void changePageIndex(int index, context) {
    emit(HomeInitial());
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CartScreen()),
      );
    } else {
      currentIndex = index;
    }
    emit(HomeChangePageIndexState());
  }

  getHomeScreenApi({required BuildContext context}) async {
    emit(HomeGetHomePageDataLoadingState());
    final response =
        await Repository.instance.homeRepository().featchHomeData();
    // return response;
    if (response is HomePageApiSuccessModel) {
      log(response.data!.toString());
      homePageApiModel = response;
      emit(HomeGetHomePageDataSuccessState(response));
    } else if (response is HomePageApiErrorModel) {
      log('Error: ${response.messages}');
      if (response.messages[0] == "Authentication Failed.") {
        log('Error: ${response.messages}');

        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginRoute, (route) => false);
      }
      homePageApiErrorModel = response;
      emit(HomeGetHomePageDataErrorState(response));
    } else if (response is HomePageApiError400Model) {
      log(response.detail.toString());
      homePageApiError404Model = response;
      emit(HomeGetHomePageDataError404State(response));
    }
  }
}

class Items {
  int? index;
  String? text;
  String? icon;
  Function? onPressed;

  Items({
    required this.index,
    required this.text,
    required this.icon,
    required this.onPressed,
  });
}
