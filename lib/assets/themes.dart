import 'package:flutter/material.dart';
import 'package:places/assets/colors.dart';
import 'package:places/assets/text_style.dart';

class AppTheme {
  static final ligthThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.darkBlack,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle:
          AppTypography.subtitle18Medium.copyWith(color: AppColors.ligthMain),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20.0),
      ),
      unselectedLabelColor: AppColors.secondary2Opacity,
      labelStyle: AppTypography.small14Bold,
    ),
  );

  static final darkThemeData = ThemeData(
    colorScheme: ColorScheme.dark(
      surface: Colors.deepOrange,
      secondary: AppColors.darkGreen,
      onPrimary: Colors.pink,
      primary: Colors.red,
      background: Colors.yellow,
    ),
    appBarTheme: AppBarTheme(
      // backgroundColor: AppColors.darkMain,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle:
          AppTypography.subtitle18Medium.copyWith(color: AppColors.white),
    ),
  );
}
