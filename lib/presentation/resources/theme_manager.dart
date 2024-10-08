import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/presentation/resources/colors_manager.dart';
import '/presentation/resources/font_manager.dart';
import '/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // mainColors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryLight,
    primaryColorDark: ColorManager.primaryDark,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.primaryLight,
    scaffoldBackgroundColor: ColorManager.white,
    primarySwatch: ColorManager.themeColor,

    // cardTheme

    // app bar Theme
    appBarTheme: const AppBarTheme(
        backgroundColor: ColorManager.primaryLight,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(
          color: ColorManager.white,
        )),

    // buttons Theme

    //elevated Button Theme

    // textTheme
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: AppSize.s32,
        fontWeight: FontWeightManager.regular,
        color: ColorManager.white,
        fontFamily: FontConstants.fontFamily,
      ),
      titleMedium: TextStyle(
        fontSize: AppSize.s25,
        fontWeight: FontWeightManager.bold,
        color: ColorManager.greyDark,
        fontFamily: FontConstants.fontFamily,
      ),
      bodyLarge: TextStyle(
        fontSize: AppSize.s18,
        fontWeight: FontWeightManager.light,
        color: ColorManager.white,
        fontFamily: FontConstants.fontFamily,
      ),
      titleSmall: TextStyle(
        fontSize: AppSize.s17,
        fontWeight: FontWeightManager.bold,
        color: ColorManager.grey3,
      ),
/*
      bodyText2: TextStyle(
        fontSize: AppSize.s15,
        fontWeight: FontWeightManager.bold,
        color: ColorManager.greyDark,
      ),
*/
    ),

    //input decoration theme (text form field)

    sliderTheme: const SliderThemeData(
        valueIndicatorColor: ColorManager.transparent,
        valueIndicatorTextStyle: TextStyle(
            color: ColorManager.primary, fontWeight: FontWeightManager.medium),
        thumbColor: ColorManager.primary,
        activeTrackColor: ColorManager.primary,
        inactiveTrackColor: ColorManager.greyDark,
        inactiveTickMarkColor: ColorManager.transparent,
        activeTickMarkColor: ColorManager.transparent),
  );
}
