import 'package:flutter/material.dart';
import 'package:places/assets/colors.dart';
import 'package:places/assets/text_style.dart';

class AppTheme {
  static final ligthThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.ligthMain,
    colorScheme: const ColorScheme.light(
      secondary: AppColors.secondary,
      error: AppColors.ligthRed,
    ),
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0.0,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: AppColors.ligthMain,
      ),
      titleTextStyle:
          AppTypography.subtitle18Medium.copyWith(color: AppColors.ligthMain),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20.0),
      ),
      unselectedLabelColor: AppColors.secondary2Opacity,
      labelColor: AppColors.white,
      labelStyle: AppTypography.small14Bold,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: AppColors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.ligthGreen,
        foregroundColor: AppColors.white,
        minimumSize: const Size.fromHeight(48.0),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        textStyle: AppTypography.button14Bold,
        disabledBackgroundColor: AppColors.ligthBackgroung,
        disabledForegroundColor: AppColors.secondary2Opacity,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.secondary,
        // maximumSize: const Size(double.infinity, 40.0),
        elevation: 0.0,
        textStyle: AppTypography.small14Regular,
      ),
    ),
    sliderTheme: SliderThemeData(
      thumbColor: AppColors.white,
      activeTrackColor: AppColors.ligthGreen,
      inactiveTrackColor: AppColors.secondary2Opacity,
      trackHeight: 2.0,
      rangeThumbShape: const RoundRangeSliderThumbShape(
        elevation: 4.0,
        pressedElevation: 4.0,
      ),
      overlayColor: AppColors.ligthGreen.withOpacity(0.12),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppTypography.text16Regular
          .copyWith(color: AppColors.secondary2Opacity),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 10.0,
      ),
      errorStyle: const TextStyle(height: 0.0),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.secondary2Opacity),
        borderRadius: BorderRadius.circular(8.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.ligthRed.withOpacity(0.4),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.ligthGreen.withOpacity(0.4),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.ligthRed.withOpacity(0.4),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.secondary2Opacity,
      thickness: 0.8,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: AppColors.secondary2Opacity,
      cursorColor: AppColors.ligthMain,
      selectionHandleColor: AppColors.ligthGreen,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.secondary2Opacity,
      circularTrackColor: AppColors.ligthBackgroung,
    ),
  );

  static final darkThemeData = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkMain,
    colorScheme: const ColorScheme.dark(
      secondary: AppColors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkMain,
      elevation: 0.0,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
      titleTextStyle:
          AppTypography.subtitle18Medium.copyWith(color: AppColors.white),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      unselectedLabelColor: AppColors.secondary2,
      labelColor: AppColors.secondary,
      labelStyle: AppTypography.small14Bold,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: AppColors.darkMain,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkGreen,
        foregroundColor: AppColors.white,
        minimumSize: const Size.fromHeight(48.0),
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        textStyle: AppTypography.button14Bold,
        disabledBackgroundColor: AppColors.darkBlack,
        disabledForegroundColor: AppColors.secondary2Opacity,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.darkMain,
        foregroundColor: AppColors.white,
        // maximumSize: const Size(double.infinity, 40.0),
        elevation: 0.0,
        textStyle: AppTypography.small14Regular,
      ),
    ),
    sliderTheme: SliderThemeData(
      thumbColor: AppColors.white,
      activeTrackColor: AppColors.darkGreen,
      inactiveTrackColor: AppColors.secondary2Opacity,
      trackHeight: 2.0,
      rangeThumbShape: const RoundRangeSliderThumbShape(
        elevation: 4.0,
        pressedElevation: 4.0,
      ),
      overlayColor: AppColors.darkGreen.withOpacity(0.12),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppTypography.text16Regular
          .copyWith(color: AppColors.secondary2Opacity),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 10.0,
      ),
      errorStyle: const TextStyle(height: 0.0),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.secondary2Opacity),
        borderRadius: BorderRadius.circular(8.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.darkRed.withOpacity(0.4),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.darkGreen.withOpacity(0.4),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.darkRed.withOpacity(0.4),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.secondary2Opacity,
      thickness: 0.8,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: AppColors.secondary2Opacity,
      cursorColor: AppColors.white,
      selectionHandleColor: AppColors.darkGreen,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.secondary2Opacity,
      circularTrackColor: AppColors.darkBlack,
    ),
  );
}

extension CustomColorScheme on ColorScheme {
  Color get secondary2 => AppColors.secondary2;
  Color get secondary2Opacity => AppColors.secondary2Opacity;

  Color get textColor =>
      brightness == Brightness.light ? AppColors.secondary : AppColors.white;

  Color get textAppBarColor =>
      brightness == Brightness.light ? AppColors.ligthMain : AppColors.white;

  Color get customBackground => brightness == Brightness.light
      ? AppColors.ligthBackgroung
      : AppColors.darkBlack;

  Color get green => brightness == Brightness.light
      ? AppColors.ligthGreen
      : AppColors.darkGreen;

  Color get yellow => brightness == Brightness.light
      ? AppColors.ligthYellow
      : AppColors.darkYellow;
}

extension CustomTextTheme on TextTheme {
  TextStyle get largeTitle32Bold => AppTypography.largeTitle32Bold;
  TextStyle get title24Bold => AppTypography.title24Bold;
  TextStyle get subtitle18Medium => AppTypography.subtitle18Medium;
  TextStyle get text16Medium => AppTypography.text16Medium;
  TextStyle get text16Regular => AppTypography.text16Regular;
  TextStyle get small14Bold => AppTypography.small14Bold;
  TextStyle get small14Regular => AppTypography.small14Regular;
  TextStyle get superSmall12Regular => AppTypography.superSmall12Regular;
  TextStyle get button14Bold => AppTypography.button14Bold;
}

extension TextButtonAppBar on ThemeData {
  ButtonStyle get greenTextButtonTheme => brightness == Brightness.light
      ? TextButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.ligthGreen,
          elevation: 0.0,
          textStyle: AppTypography.text16Medium,
        )
      : TextButton.styleFrom(
          backgroundColor: AppColors.darkMain,
          foregroundColor: AppColors.darkGreen,
          elevation: 0.0,
          textStyle: AppTypography.text16Medium,
        );

  ButtonStyle get greyTextButtonTheme => brightness == Brightness.light
      ? TextButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.secondary2,
          elevation: 0.0,
          textStyle: AppTypography.text16Medium,
        )
      : TextButton.styleFrom(
          backgroundColor: AppColors.darkMain,
          foregroundColor: AppColors.secondary2,
          elevation: 0.0,
          textStyle: AppTypography.text16Medium,
        );
}

extension TextFieldDropDown on ThemeData {
  InputDecoration get decoration => brightness == Brightness.light
      ? InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondary2Opacity),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.ligthRed.withOpacity(0.4)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.ligthGreen.withOpacity(0.4),
              width: 2.0,
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.ligthRed.withOpacity(0.4)),
          ),
        )
      : InputDecoration(
          hintStyle: AppTypography.text16Regular
              .copyWith(color: AppColors.secondary2Opacity),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 10.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.secondary2Opacity),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.ligthRed.withOpacity(0.4),
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.ligthGreen.withOpacity(0.4),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkRed.withOpacity(0.4)),
          ),
        );

  InputDecoration get decorationFilled => brightness == Brightness.light
      ? InputDecoration(
          filled: true,
          fillColor: AppColors.ligthBackgroung,
          hintStyle: AppTypography.text16Regular
              .copyWith(color: AppColors.secondary2Opacity),
          contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0),
          ),
        )
      : InputDecoration(
          filled: true,
          fillColor: AppColors.darkBlack,
          hintStyle: AppTypography.text16Regular
              .copyWith(color: AppColors.secondary2Opacity),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 10.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0),
          ),
        );
}
