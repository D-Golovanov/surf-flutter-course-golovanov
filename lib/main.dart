import 'package:flutter/material.dart';
import 'package:places/assets/themes.dart';
import 'package:places/controller/bottom_navigation_bar_controller.dart';
import 'package:places/controller/filter_controller.dart';
import 'package:places/controller/new_place_controller.dart';
import 'package:places/controller/search_place_controller.dart';
import 'package:places/controller/theme_controller.dart';
import 'package:places/ui/screens/application_screen/application_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeController(),
      ),
      ChangeNotifierProvider(
        create: (context) => BottomNavigationBarController(),
      ),
      ChangeNotifierProvider(
        create: (context) => NewPlaceController(),
      ),
      ChangeNotifierProvider(
        create: (context) => SearchPlaceController(),
      ),
      ChangeNotifierProvider(
        create: (context) => FilterController(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, state, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.ligthThemeData,
        darkTheme: AppTheme.darkThemeData,
        themeMode: state.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
        home: const ApplicationScreen(),
      ),
    );
  }
}
