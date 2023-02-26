import 'package:eldaheeh/shared/styles/styles.dart';
import 'package:eldaheeh/shared/styles/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';
import 'font_manager.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: Colors.yellow,
  //primarySwatch: ColorManager.primary,
  scaffoldBackgroundColor: HexColor('333739'),

  // input decoration theme (text form field)
  inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      // hint style
      hintStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      labelStyle:
          getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error),

      // enabled border style
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorManager.defaultRedColor2, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

      // focused border style
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorManager.defaultRedColor2, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

      // error border style
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      // focused border style
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorManager.defaultRedColor2, width: AppSize.s18),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),

  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontFamily: 'Jannah',
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: ColorManager.grey,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: HexColor('333739'),
  ),

  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1.3,
    ),
  ),
  fontFamily: 'Jannah',
);

ThemeData lightTheme = ThemeData(
  // // main colors
  // primaryColor: Colors.red,
  // primaryColorLight: Colors.yellow,
  // primaryColorDark: Colors.green,
  // disabledColor: Colors.blue,
  // splashColor: Colors.black,
  scaffoldBackgroundColor: ColorManager.defaultwhiteColor3,
  drawerTheme: DrawerThemeData(
    backgroundColor: ColorManager.defaultwhiteColor3,
  ),

  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ColorManager.defaultRedColor2,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: ColorManager.defaultRedColor2,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontFamily: 'Jannah',
      color: ColorManager.defaultwhiteColor3,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: ColorManager.defaultwhiteColor3,
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: ColorManager.defaultRedColor2,
    unselectedItemColor: ColorManager.white,
    elevation: 20.0,
    backgroundColor: ColorManager.defaultwhiteColor3,
  ),

  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: ColorManager.defaultBlack,
    ),
    subtitle1: TextStyle(
      fontSize: 10.0,
      fontWeight: FontWeight.w600,
      color: ColorManager.defaultBlack,
      height: 1.3,
    ),
    // bodyText1: TextStyle(
    //   fontSize: 18.0,
    //   fontWeight: FontWeight.w600,
    //   color: Colors.purpleAccent,
    // ),
    // subtitle1: TextStyle(
    //   fontSize: 14.0,
    //   fontWeight: FontWeight.w600,
    //   color: Colors.purpleAccent,
    //   height: 1.3,
    // ),
    // displayLarge:
    //     getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
    // headlineLarge:
    //     getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
    // headlineMedium:
    //     getRegularStyle(color: ColorManager.darkGrey, fontSize: FontSize.s14),
    // titleMedium:
    //     getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16),
    // bodyLarge: getRegularStyle(color: ColorManager.grey1),
    // bodySmall: getRegularStyle(color: ColorManager.grey),
  ),

  cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4),

  buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary),

  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s17),
          primary: ColorManager.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12)))),

  // input decoration theme (text form field)
  inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      // hint style
      hintStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      labelStyle:
          getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error),

      // enabled border style
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorManager.defaultRedColor2, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

      // focused border style
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

      // error border style
      errorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      // focused border style
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: ColorManager.defaultRedColor2, width: AppSize.s1_5),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),

  fontFamily: 'Jannah',
);
