import 'package:flutter/material.dart';

class NewPlaceController extends ChangeNotifier {
  String get category => _category;

  set category(String value) {
    _category = value;
    notifyListeners();
  }

  String get name => _name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  String get description => _description;

  set description(String value) {
    _description = value;
    notifyListeners();
  }

  String _category = '';
  String _name = '';
  String _latitude = '';
  String _longitude = '';
  String _description = '';
}
