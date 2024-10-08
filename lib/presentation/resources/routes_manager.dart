import 'package:flutter/material.dart';
import '/presentation/about/about_app_screen.dart';
import '/presentation/account/account_screen.dart';
import '/presentation/account/accountn_iformation_screen.dart';
import '/presentation/add_new_address/add_new_address_screen.dart';
import '/presentation/branches/branches_screen.dart';
import '/presentation/cart/cart_screen.dart';
import '/presentation/change_password/change_password_screen.dart';
import '/presentation/ads/ads_screen.dart';
import '/presentation/auth/forget_password/forget_password_screen.dart';
import '/presentation/auth/forget_password/set_new_password_screen.dart';
import '/presentation/auth/login/login_screen.dart';
import '/presentation/auth/register/register_screen.dart';
import '/presentation/categories/categories_screen.dart';
import '/presentation/contact_us/contact_us_screen.dart';
import '/presentation/guide/guide_screen.dart';
import '/presentation/home/home_layout.dart';
import '/presentation/location/choose_location_screen.dart';
import '/presentation/location/location_screen.dart';
import '/presentation/my_orders/my_orders_screen.dart';
import '/presentation/policy/privacy_policy_screen.dart';
import '/presentation/product/product_screen.dart';

import '/presentation/resources/strings_manager.dart';
import '/presentation/reviews/reviews_screen.dart';
import '/presentation/search/search_filter_screen.dart';
import '/presentation/search/search_screen.dart';
import '/presentation/shop/shop_about_screen.dart';
import '/presentation/shop/shop_filter_screen.dart';
import '/presentation/wish_list/wish_filter_screen.dart';
import '/presentation/wish_list/wish_list_screen.dart';

class Routes {
  static const initialRoute = '/';
  static const guideRoute = '/guide';
  static const loginRoute = '/login';
  static const registerRoute = '/register';
  static const forgetPasswordRoute = '/forgetPassword';
  static const setNewPasswordRoute = '/setNewPasswordRoute';
  static const locationRoute = '/location';
  static const chooseLocationRoute = '/chooseLocation';
  static const ads = '/ads';
  static const home = '/home';
  static const categories = '/categories';
  static const account = '/account';
  // static const accountInformation = '/accountInformation';
  static const changePassword = '/change_Password';
  static const about = '/about';
  static const policy = '/policy';
  static const contactUs = '/contact_us';
  // static const shop = '/shop';
  //static const shopAbout = '/shop_about';
  //static const branches = '/branches';
  static const reviews = '/reviews';
  static const search = '/search';
  // static const product = '/product';
  static const wishList = '/wish_list';
  static const myOrders = '/my_orders';
  static const cart = '/cart';
  static const wishFilet = '/wishFilter';
  static const shopFilet = '/shopFilter';
  static const searchFilet = '/searchFilter';
  static const addNewAddress = '/addNewAddress';
}

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.initialRoute:
      //   return MaterialPageRoute(builder: (context) => const QuoteScreen());
      case Routes.guideRoute:
        return MaterialPageRoute(builder: (context) => const GuideScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordScreen());
      case Routes.setNewPasswordRoute:
        return MaterialPageRoute(
            builder: (context) => const SetNewPasswordScreen());
      case Routes.locationRoute:
        return MaterialPageRoute(builder: (context) => const LocationScreen());
      case Routes.ads:
        return MaterialPageRoute(builder: (context) => const AdsScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => HomeLayout());
      case Routes.chooseLocationRoute:
        return MaterialPageRoute(
            builder: (context) => const ChooseLocationScreen());
      case Routes.categories:
        return MaterialPageRoute(
            builder: (context) => const CategoriesScreen());
      case Routes.account:
        return MaterialPageRoute(builder: (context) => const AccountScreen());
      // case Routes.accountInformation:
      //   return MaterialPageRoute(
      //       builder: (context) => const AccountInformationScreen());
      case Routes.changePassword:
        return MaterialPageRoute(
            builder: (context) => const ChangePasswordScreen());
      case Routes.about:
        return MaterialPageRoute(builder: (context) => const AboutAppScreen());
      case Routes.policy:
        return MaterialPageRoute(
            builder: (context) => const PrivacyPolicyScreen());
      case Routes.contactUs:
        return MaterialPageRoute(builder: (context) => ContactusScreen());
      //  case Routes.shop:
      //  return MaterialPageRoute(builder: (context) => ShopScreen());
      // case Routes.shopAbout:
      //   return MaterialPageRoute(builder: (context) => ShopAboutScreen());
      // case Routes.branches:
      //   return MaterialPageRoute(builder: (context) => BranchesScreen());
      case Routes.reviews:
        return MaterialPageRoute(builder: (context) => ReviewsScreen());
      case Routes.search:
        return MaterialPageRoute(builder: (context) => SearchScreen());
      // case Routes.product:
      //   return MaterialPageRoute(builder: (context) => ProductScreen());
      case Routes.wishList:
        return MaterialPageRoute(builder: (context) => WishListScreen());
      case Routes.myOrders:
        return MaterialPageRoute(builder: (context) => MyOrdersScreen());
      case Routes.cart:
        return MaterialPageRoute(builder: (context) => CartScreen());
      case Routes.wishFilet:
        return MaterialPageRoute(builder: (context) => WishListFilterScreen());
      case Routes.shopFilet:
        return MaterialPageRoute(builder: (context) => ShopFilterScreen());
      case Routes.searchFilet:
        return MaterialPageRoute(builder: (context) => SearchFilterScreen());
      case Routes.addNewAddress:
        return MaterialPageRoute(builder: (context) => AddNewAddressScreen());
      // default:
      //   return defaultRoute();
    }
  }
}

Route<dynamic> defaultRoute() => MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(
            StringsManager.noRouteFound,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
