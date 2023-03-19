import 'package:flutter/material.dart';
import 'package:places/assets/colors.dart';

class AppAssets {
  static const favorite = 'res/images/icons/heart.svg';
}

class AppDimensions {
  static const k16 = 16.0;
}

class AppTypography {
  static const textAppTitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32.0,
    fontWeight: FontWeight.w700,
    color: AppColors.darkBlue,
  );

  static const textCardTitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    height: 1.25,
    fontWeight: FontWeight.w500,
    color: AppColors.darkTextBlue,
  );
  static const textCardDescription = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    height: 18.0 / 14.0,
    color: AppColors.lightTextBlue,
  );
  static const textCardCategory = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    height: 18.0 / 14.0,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
}
