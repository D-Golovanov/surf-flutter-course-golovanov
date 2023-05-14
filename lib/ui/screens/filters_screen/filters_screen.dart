import 'package:flutter/material.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/strings.dart';
import 'package:places/assets/themes.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screens/filters_screen/filters_widgets.dart';
import 'package:places/ui/widgets/center_app_bar.dart';
import 'package:places/ui/widgets/label_text_upper_case_widget.dart';
import 'package:places/util/area_included_place.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<String> categoryFilters = [];

  RangeValues range = const RangeValues(100.0, 10000.0);

  List<String> myPosition = ['45.078474', '38.895659'];

  List<Sight> filtredSights = [];

  String dimensionFrom = '';
  String dimensionTo = '';

  String displayFrom = '';
  String displayTo = '';

  @override
  void initState() {
    super.initState();
    _convertDimension();
    _findPlaceFilter(mocks);
  }

  String _buildDimensionString() {
    return '${AppStrings.from} $displayFrom $dimensionFrom ${AppStrings.to} $displayTo $dimensionTo';
  }

  void _convertDimension() {
    range.start > 999.0
        ? dimensionFrom = AppStrings.kilometers
        : dimensionFrom = AppStrings.meters;
    displayFrom = range.start > 999.0
        ? (range.start.toInt() / 1000).toString()
        : range.start.toInt().toString();

    range.end > 999.0
        ? dimensionTo = AppStrings.kilometers
        : dimensionTo = AppStrings.meters;
    displayTo = range.end > 999.0
        ? (range.end.toInt() / 1000).toString()
        : range.end.toInt().toString();
  }

  void _findPlaceFilter(List<Sight> data) {
    // ⁉ все таки не получилось додуматься, как отфильтровать список по 2 параметрам
    // если фильтры категорий выбраны, то ищет с их учетом и по вхождению в область
    // если фильтров нет, то просто по области

    categoryFilters.isNotEmpty
        ? filtredSights = data
            .where(
              (sight) =>
                  areaIncludedPlace(
                    myPosition[0],
                    myPosition[1],
                    sight.lat,
                    sight.lon,
                    range.start,
                    range.end,
                  ) &&
                  categoryFilters.contains(sight
                      .type), // отличие только в этой строчке, но не нашел как сделать это без условия
            )
            .toList()
        : filtredSights = data
            .where(
              (sight) => areaIncludedPlace(
                myPosition[0],
                myPosition[1],
                sight.lat,
                sight.lon,
                range.start,
                range.end,
              ),
            )
            .toList();
  }

  void _clearFilter() {
    categoryFilters.clear();
    range = const RangeValues(100.0, 10000.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CenterAppBar(
        title: '',
        actionWidget: TextButton(
          style: Theme.of(context).greenTextButtonTheme,
          onPressed: () {
            setState(() {
              _clearFilter();
              _convertDimension();
              _findPlaceFilter(mocks);
            });
          },
          child: const Text(AppStrings.clearAppBar),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24.0),
            const LabelTextUpperCaseWidget(text: AppStrings.categorys),
            const SizedBox(height: 24.0),
            SizedBox(
              height: 230.0,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                children: [
                  CategoryFilterButton(
                    choice: categoryFilters.contains(AppStrings.hotel),
                    titleCategort: AppStrings.hotel,
                    assetIconPath: AppAssets.categoryHotel,
                    onPressed: () {
                      setState(() {
                        categoryFilters.contains(AppStrings.hotel)
                            ? categoryFilters.remove(AppStrings.hotel)
                            : categoryFilters.add(AppStrings.hotel);
                        _findPlaceFilter(mocks);
                      });
                    },
                  ),
                  CategoryFilterButton(
                    choice: categoryFilters.contains(AppStrings.restourant),
                    titleCategort: AppStrings.restourant,
                    assetIconPath: AppAssets.categoryRestourant,
                    onPressed: () {
                      setState(() {
                        categoryFilters.contains(AppStrings.restourant)
                            ? categoryFilters.remove(AppStrings.restourant)
                            : categoryFilters.add(AppStrings.restourant);
                        _findPlaceFilter(mocks);
                      });
                    },
                  ),
                  CategoryFilterButton(
                    choice:
                        categoryFilters.contains(AppStrings.particularPlace),
                    titleCategort: AppStrings.particularPlace,
                    assetIconPath: AppAssets.categoryParticular,
                    onPressed: () {
                      setState(() {
                        categoryFilters.contains(AppStrings.particularPlace)
                            ? categoryFilters.remove(AppStrings.particularPlace)
                            : categoryFilters.add(AppStrings.particularPlace);
                        _findPlaceFilter(mocks);
                      });
                    },
                  ),
                  CategoryFilterButton(
                    choice: categoryFilters.contains(AppStrings.park),
                    titleCategort: AppStrings.park,
                    assetIconPath: AppAssets.categoryPark,
                    onPressed: () {
                      setState(() {
                        categoryFilters.contains(AppStrings.park)
                            ? categoryFilters.remove(AppStrings.park)
                            : categoryFilters.add(AppStrings.park);
                        _findPlaceFilter(mocks);
                      });
                    },
                  ),
                  CategoryFilterButton(
                    choice: categoryFilters.contains(AppStrings.museum),
                    titleCategort: AppStrings.museum,
                    assetIconPath: AppAssets.categoryMuseum,
                    onPressed: () {
                      setState(() {
                        categoryFilters.contains(AppStrings.museum)
                            ? categoryFilters.remove(AppStrings.museum)
                            : categoryFilters.add(AppStrings.museum);
                        _findPlaceFilter(mocks);
                      });
                    },
                  ),
                  CategoryFilterButton(
                    choice: categoryFilters.contains(AppStrings.cafe),
                    titleCategort: AppStrings.cafe,
                    assetIconPath: AppAssets.categoryCafe,
                    onPressed: () {
                      setState(() {
                        categoryFilters.contains(AppStrings.cafe)
                            ? categoryFilters.remove(AppStrings.cafe)
                            : categoryFilters.add(AppStrings.cafe);
                        _findPlaceFilter(mocks);
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 56.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.distances,
                  style: Theme.of(context).textTheme.text16Regular,
                ),
                Text(
                  _buildDimensionString(),
                  style: Theme.of(context).textTheme.text16Regular.copyWith(
                        color: Theme.of(context).colorScheme.secondary2,
                      ),
                ),
              ],
            ),
            RangeSlider(
              values: range,
              min: 100.0,
              max: 10000.0,
              divisions: 99,
              onChanged: (newValue) {
                newValue = RangeValues(
                  newValue.start.round().toDouble(),
                  newValue.end.round().toDouble(),
                );
                setState(() {
                  range = newValue;
                });
                _convertDimension();
              },
              onChangeEnd: (newValue) {
                setState(() {
                  _findPlaceFilter(mocks);
                });
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: filtredSights.isEmpty
                  ? null
                  : () {
                      debugPrint('$categoryFilters');
                      debugPrint('${range.start} - ${range.end}');
                      debugPrint('$filtredSights');
                    },
              child: Text(
                '${AppStrings.showButton.toUpperCase()} (${filtredSights.length})',
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
