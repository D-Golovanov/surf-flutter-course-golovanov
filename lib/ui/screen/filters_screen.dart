import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/strings.dart';
import 'package:places/assets/text_style.dart';
import 'package:places/assets/themes.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/widgets/bottom_bar.dart';
import 'package:places/ui/widgets/center_app_bar.dart';
import 'package:places/util/area_included_place.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  String categoryHotel = '';
  String categoryRestourant = '';
  String categoryParticular = '';
  String categoryPark = '';
  String categoryMuseum = '';
  String categoryCafe = '';
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

  void _findPlaceFilter(List<Sight> data) {
    List<Sight> hotels = [];
    List<Sight> restourant = [];
    List<Sight> particularPlace = [];
    List<Sight> park = [];
    List<Sight> museum = [];
    List<Sight> cafe = [];

    if (categoryHotel.isNotEmpty) {
      hotels = data.where((sight) => sight.type == categoryHotel).toList();
    }
    if (categoryRestourant.isNotEmpty) {
      restourant =
          data.where((sight) => sight.type == categoryRestourant).toList();
    }
    if (categoryParticular.isNotEmpty) {
      particularPlace =
          data.where((sight) => sight.type == categoryParticular).toList();
    }
    if (categoryPark.isNotEmpty) {
      park = data.where((sight) => sight.type == categoryPark).toList();
    }
    if (categoryMuseum.isNotEmpty) {
      museum = data.where((sight) => sight.type == categoryMuseum).toList();
    }
    if (categoryCafe.isNotEmpty) {
      cafe = data.where((sight) => sight.type == categoryCafe).toList();
    }

    final allCategories = [
      ...hotels,
      ...restourant,
      ...particularPlace,
      ...park,
      ...museum,
      ...cafe
    ];
    if (categoryHotel.isNotEmpty ||
        categoryRestourant.isNotEmpty ||
        categoryParticular.isNotEmpty ||
        categoryPark.isNotEmpty ||
        categoryMuseum.isNotEmpty ||
        categoryCafe.isNotEmpty) {
      filtredSights = allCategories
          .where((sight) => areaIncludedPlace(
                myPosition[0],
                myPosition[1],
                sight.lat,
                sight.lon,
                range.start,
                range.end,
              ))
          .toList();
    } else {
      filtredSights = data
          .where((sight) => areaIncludedPlace(
                myPosition[0],
                myPosition[1],
                sight.lat,
                sight.lon,
                range.start,
                range.end,
              ))
          .toList();
    }
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

  void _clearFilter() {
    categoryHotel = '';
    categoryRestourant = '';
    categoryParticular = '';
    categoryPark = '';
    categoryMuseum = '';
    categoryCafe = '';
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
            Text(
              AppStrings.category.toUpperCase(),
              style: AppTypography.superSmall12Regular.copyWith(
                color: Theme.of(context).colorScheme.secondary2Opacity,
              ),
            ),
            const SizedBox(height: 24.0),
            SizedBox(
              height: 230.0,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                children: [
                  CategoryFilterButton(
                    choice: categoryHotel,
                    titleCategort: AppStrings.hotel,
                    assetIconPath: AppAssets.categoryHotel,
                    onPressed: () {
                      setState(() {
                        categoryHotel.isEmpty
                            ? categoryHotel = AppStrings.hotel
                            : categoryHotel = '';
                        _findPlaceFilter(mocks);
                      });
                    },
                  ),
                  CategoryFilterButton(
                    choice: categoryRestourant,
                    titleCategort: AppStrings.restourant,
                    assetIconPath: AppAssets.categoryRestourant,
                    onPressed: () {
                      setState(() {
                        categoryRestourant.isEmpty
                            ? categoryRestourant = AppStrings.restourant
                            : categoryRestourant = '';
                        _findPlaceFilter(mocks);
                      });
                    },
                  ),
                  CategoryFilterButton(
                    choice: categoryParticular,
                    titleCategort: AppStrings.particularPlace,
                    assetIconPath: AppAssets.categoryParticular,
                    onPressed: () {
                      setState(() {
                        categoryParticular.isEmpty
                            ? categoryParticular = AppStrings.particularPlace
                            : categoryParticular = '';
                        _findPlaceFilter(mocks);
                      });
                    },
                  ),
                  CategoryFilterButton(
                    choice: categoryPark,
                    titleCategort: AppStrings.park,
                    assetIconPath: AppAssets.categoryPark,
                    onPressed: () {
                      setState(() {
                        categoryPark.isEmpty
                            ? categoryPark = AppStrings.park
                            : categoryPark = '';
                        _findPlaceFilter(mocks);
                      });
                    },
                  ),
                  CategoryFilterButton(
                    choice: categoryMuseum,
                    titleCategort: AppStrings.museum,
                    assetIconPath: AppAssets.categoryMuseum,
                    onPressed: () {
                      setState(() {
                        categoryMuseum.isEmpty
                            ? categoryMuseum = AppStrings.museum
                            : categoryMuseum = '';
                        _findPlaceFilter(mocks);
                      });
                    },
                  ),
                  CategoryFilterButton(
                    choice: categoryCafe,
                    titleCategort: AppStrings.cafe,
                    assetIconPath: AppAssets.categoryCafe,
                    onPressed: () {
                      setState(() {
                        categoryCafe.isEmpty
                            ? categoryCafe = AppStrings.cafe
                            : categoryCafe = '';
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
              min: 100,
              max: 10000,
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
                      debugPrint('press show');
                    },
              child: Text(
                '${AppStrings.showButton.toUpperCase()} (${filtredSights.length})',
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

class CategoryFilterButton extends StatelessWidget {
  final String choice;
  final String titleCategort;
  final String assetIconPath;
  final VoidCallback onPressed;

  const CategoryFilterButton({
    super.key,
    required this.assetIconPath,
    required this.titleCategort,
    required this.choice,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
            width: 64.0,
            height: 64.0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.green.withOpacity(0.16),
              borderRadius: BorderRadius.circular(32.0),
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: SvgPicture.asset(
                assetIconPath,
                color: Theme.of(context).colorScheme.green,
              ),
            ),
          ),
          if (choice.isNotEmpty)
            Positioned(
              right: 0.0,
              bottom: 0.0,
              child: IgnorePointer(
                child: SvgPicture.asset(
                  Theme.of(context).brightness == Brightness.light
                      ? AppAssets.filterCheckLight
                      : AppAssets.filterCheckDark,
                ),
              ),
            ),
        ]),
        const SizedBox(height: 12.0),
        Text(
          titleCategort,
          style: AppTypography.superSmall12Regular,
        ),
      ],
    );
  }
}
