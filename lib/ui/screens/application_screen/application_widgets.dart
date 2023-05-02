import 'package:flutter/material.dart';
import 'package:places/ui/screens/settings_screen/settings_screen.dart';
import 'package:places/ui/screens/sight_list_screen/sight_list_screen.dart';
import 'package:places/ui/screens/visiting_screen/visiting_screen.dart';

Widget buildBodyPage(int index) {
  const widgets = [
    SightListScreen(),
    Center(child: Text('Map')),
    VisitingScreen(),
    SettingsScreen(),
  ];

  return widgets[index];
}
