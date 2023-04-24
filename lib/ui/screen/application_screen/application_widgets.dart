import 'package:flutter/material.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

Widget buildBodyPage(int index) {
  const widgets = [
    SightListScreen(),
    Center(child: Text('Map')),
    VisitingScreen(),
    SettingsScreen(),
  ];

  return widgets[index];
}
