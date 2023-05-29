import 'package:flutter/material.dart';
import 'package:places/assets/strings.dart';
import 'package:places/domain/location.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/util/area_included_place.dart';
import 'package:places/util/convert_dimension.dart';

class FilterController extends ChangeNotifier {
  Location userPosition =
      Location(latitude: '45.078474', longitude: '38.895659');

  RangeValues _range = const RangeValues(100.0, 10000.0);
  bool _isFiltred = false;

  List<String> _categoryFilters = [];

  List<Sight> filtredSights = [];

  bool get isFiltred {
    return (_range != const RangeValues(100.0, 10000.0) ||
            _categoryFilters.isNotEmpty)
        ? _isFiltred = true
        : _isFiltred = false;
  }

  RangeValues get range => _range;
  double get rangeStart => range.start;
  double get rangeEnd => range.end;

  List<String> get categoryFilters => _categoryFilters;

  String get dimensionString =>
      '${AppStrings.from} ${convertDimension(rangeStart)} ${AppStrings.to} ${convertDimension(rangeEnd)}';

  @override
  String toString() =>
      'Range: $rangeStart - $rangeEnd, \nCategory: $_categoryFilters \nFiltred: $filtredSights \n is filtred: $isFiltred';

  void setRange(RangeValues newRange) {
    final tmpRange = RangeValues(
      newRange.start.round().toDouble(),
      newRange.end.round().toDouble(),
    );
    _range = tmpRange;
    notifyListeners();
  }

  void resetRange() {
    _range = const RangeValues(100.0, 10000.0);
  }

  bool choiceCategory(String value) => categoryFilters.contains(value);

  void addCategory(String value) {
    categoryFilters.add(value);
    notifyListeners();
  }

  void removeCategory(String value) {
    categoryFilters.remove(value);
    notifyListeners();
  }

  void clearCategory() {
    resetRange();
    categoryFilters.clear();
    notifyListeners();
  }

  Future<void> findPlaceFilter() async {
    debugPrint('find');
    final data = mocks;

    categoryFilters.isNotEmpty
        ? filtredSights = data
            .where(
              (sight) =>
                  areaIncludedPlace(
                    Location(
                      latitude: userPosition.latitude,
                      longitude: userPosition.longitude,
                    ),
                    Location(latitude: sight.lat, longitude: sight.lon),
                    rangeStart,
                    rangeEnd,
                  ) &&
                  categoryFilters.contains(sight.type),
            )
            .toList()
        : filtredSights = data
            .where(
              (sight) => areaIncludedPlace(
                Location(
                  latitude: userPosition.latitude,
                  longitude: userPosition.longitude,
                ),
                Location(latitude: sight.lat, longitude: sight.lon),
                rangeStart,
                rangeEnd,
              ),
            )
            .toList();
  }
}
