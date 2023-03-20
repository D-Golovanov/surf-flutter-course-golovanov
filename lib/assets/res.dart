import 'package:flutter/material.dart';
import 'package:places/assets/colors.dart';

class AppAssets {
  static const favorite = 'res/images/icons/heart.svg';
  static const arrowBack = 'res/images/icons/arrow_back.svg';
  static const track = 'res/images/icons/go.svg';
  static const calendar = 'res/images/icons/calendar.svg';
}

class AppDimensions {
  static const k16 = 16.0;
}

class AppTypography {
  static const text32AppTitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32.0,
    fontWeight: FontWeight.w700,
    color: AppColors.darkBlue,
  );

  static const text16CardTitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    height: 20.0 / 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.darkTextBlue,
  );
  static const text14Description = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    height: 18.0 / 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.lightTextBlue,
  );
  static const text14Category = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    height: 18.0 / 14.0,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static const title24Detail = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24.0,
    height: 28.8 / 24.0,
    fontWeight: FontWeight.w700,
    color: AppColors.darkTextBlue,
  );

  static const button14 = TextStyle(
    fontFamily: 'Roboto',
    color: AppColors.white,
    fontSize: 14.0,
    height: 18.0 / 14.0,
    letterSpacing: 0.3,
    fontWeight: FontWeight.w700,
  );
}
