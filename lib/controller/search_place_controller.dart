import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

enum StateScreen { history, loading, search, notFound, error }

class SearchPlaceController extends ChangeNotifier {
  StateScreen _currentScreen = StateScreen.loading;
  String _textSearch = '';
  List<Sight> _placeList = [];
  List<Sight> _searchList = [];
  List<String> _historyList = [];

  TextEditingController historyTextEditingController = TextEditingController();

  Timer? searchDeboubce;

  //Getters and setters
  StateScreen get currentScreen => _currentScreen;

  set currentScreen(StateScreen newScreen) {
    _currentScreen = newScreen;
    notifyListeners();
  }

  String get textSearch => _textSearch;

  set textSearch(String value) {
    _textSearch = value;
    notifyListeners();
  }

  List<Sight> get placeList => _placeList;
  List<Sight> get searchList => _searchList;

  List<String> get historyList => _historyList;

  set placeList(List<Sight> list) {
    _placeList = list;
    notifyListeners();
  }

  //History list
  Future<void> loadHistory(List<String>? data) async {
    if (data != null && data.isNotEmpty) {
      _historyList = data;
      _currentScreen = StateScreen.history;
    } else {
      _currentScreen = StateScreen.notFound;
    }
    notifyListeners();
  }

  void addElementOnHistory(String value) {
    final tmpList = _historyList
        .where((element) => element.toLowerCase() == value.toLowerCase());

    if (tmpList.isEmpty) {
      _historyList.insert(0, value);
    } else {
      _historyList
        ..removeWhere(
          (element) => element.toLowerCase() == value.toLowerCase(),
        )
        ..insert(0, value);
    }
    notifyListeners();
  }

  void removeElementOnHistory(String value) {
    _historyList.remove(value);
    if (_historyList.isEmpty) {
      _currentScreen = StateScreen.notFound;
    }
    notifyListeners();
  }

  void clearHistory() {
    _historyList.clear();
    _currentScreen = StateScreen.notFound;
    notifyListeners();
  }

  //Search place input
  Future<void> searchPlace(String value) async {
    _currentScreen = StateScreen.loading;
    notifyListeners();

    searchDeboubce?.cancel();

    searchDeboubce = Timer(const Duration(milliseconds: 250), () async {
      debugPrint(value);
      if (value.isEmpty || value.length < 3) {
        _currentScreen = StateScreen.notFound;
      }
      if (value.isEmpty && _historyList.isNotEmpty) {
        _currentScreen = StateScreen.history;
      }
      if (value.isNotEmpty && value.length >= 3) {
        filtredPlaces(value);
        _searchList.isEmpty
            ? _currentScreen = StateScreen.notFound
            : _currentScreen = StateScreen.search;
      }
      notifyListeners();
    });
  }

  void filtredPlaces(String value) {
    _searchList = _placeList
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  void changeTextField(String value) {
    historyTextEditingController
      ..text = value
      ..selection = TextSelection.collapsed(offset: value.length);

    _textSearch = value;
    // searchPlace(value);
    notifyListeners();
  }
}
