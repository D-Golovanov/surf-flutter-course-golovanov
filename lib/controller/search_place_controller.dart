import 'dart:async';

import 'package:flutter/material.dart';

enum StateScreen { history, loading, search, notFound, error }

class SearchPlaceController extends ChangeNotifier {
  StateScreen _currentScreen = StateScreen.loading;
  String _textSearch = '';
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

  List<String> get historyList => _historyList;

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
      if (value.isEmpty) {
        _currentScreen = StateScreen.notFound;
      }
      if (value.isEmpty && _historyList.isNotEmpty) {
        _currentScreen = StateScreen.history;
      }
      if (value.isNotEmpty) {
        _currentScreen = StateScreen.search;
      }
      notifyListeners();
    });
  }

  void changeTextField(String value) {
    historyTextEditingController
      ..text = value
      ..selection = TextSelection.collapsed(offset: value.length);

    // _textSearch = value;
    searchPlace(value);
    notifyListeners();
  }
}
