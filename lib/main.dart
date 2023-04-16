import 'package:flutter/material.dart';
import 'package:places/assets/themes.dart';
import 'package:places/ui/screen/visiting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.ligthThemeData,
      darkTheme: AppTheme.darkThemeData,
      themeMode: ThemeMode.dark,
      home: const VisitingScreen(),
    );
  }
}
