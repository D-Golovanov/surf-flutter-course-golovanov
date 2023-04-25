import 'package:flutter/material.dart';
import 'package:places/assets/colors.dart';
import 'package:places/assets/text_style.dart';

class AppTheme {
  static final ligthThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.ligthMain,
    // canvasColor: Colors.red,
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
        maximumSize: const Size(double.infinity, 40.0),
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
    /*
        textTheme: TextTheme(
          //Large Title - заголовок интересных мест
          headlineLarge: AppTypography.largeTitle32Bold,
          //Title - туториал, экран детали заголовки, время пути, заголовок на достижении
          headlineSmall: AppTypography.title24Bold,
          //Subtitle - аппбар, заголовок избранного (пустых страниц) / поиска / ошибок
          titleLarge: AppTypography.subtitle18Medium,
          //Text - экшены в аппбар, карточка название, "Поделиться" экран достижеия, название в карточке поиска (выделенный текст), экран нового места "Указать на карте"
          titleMedium:
              AppTypography.text16Medium.copyWith(color: AppColors.secondary),
          //Small bold - таббар, категории карточка / детали экран, запланированная дата экран детали, "Пешеходный маршрут" и время
          titleSmall: AppTypography.small14Bold,
          //Small - поиск карточка категория, текст экранов, кнопки "Запланировать"/"В Избранное"/"Поделиться", доп текст карточки
          bodyMedium:
              AppTypography.small14Regular.copyWith(color: AppColors.secondary),
          //Super small - Экран фильтры лейбл к иконке
          bodySmall: AppTypography.superSmall14Regular,
          //Button - кнопки
          labelSmall: AppTypography.button14Bold,
        ),
        */
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
        maximumSize: const Size(double.infinity, 40.0),
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

extension ActionTextButtonAppBar on ThemeData {
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
}
