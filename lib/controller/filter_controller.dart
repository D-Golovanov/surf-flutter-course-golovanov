import 'package:flutter/material.dart';

class FilterController extends ChangeNotifier {
  Map<String, bool> filtersChoice = {
    'Отель': false,
    'Ресторан': false,
    'Особое место': false,
    'Парк': false,
    'Музей': false,
    'Кафе': false,
  };

  double _rangeStart = 100.0;
  double _rangeEnd = 10000.0;

  double get rangeStart => _rangeStart;
  double get rangeEnd => _rangeEnd;

  set rangeStart(double value) {
    _rangeStart = value;
    notifyListeners();
  }

  set rangeEnd(double value) {
    _rangeEnd = value;
    notifyListeners();
  }

  void clearFilter() {
    filtersChoice = {
      'Отель': false,
      'Ресторан': false,
      'Особое место': false,
      'Парк': false,
      'Музей': false,
      'Кафе': false,
    };
    _rangeStart = 100.0;
    _rangeEnd = 10000.0;
    notifyListeners();
  }
}
