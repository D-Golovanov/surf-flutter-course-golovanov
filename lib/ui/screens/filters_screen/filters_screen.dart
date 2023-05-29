import 'package:flutter/material.dart';
import 'package:places/assets/strings.dart';
import 'package:places/assets/themes.dart';
import 'package:places/controller/filter_controller.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screens/filters_screen/filters_widgets.dart';
import 'package:places/ui/widgets/center_app_bar.dart';
import 'package:places/ui/widgets/label_text_upper_case_widget.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FilterController>().findPlaceFilter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CenterAppBar(
        title: '',
        actionWidget: TextButton(
          style: Theme.of(context).greenTextButtonTheme,
          onPressed: () {
            context.read<FilterController>().clearCategory();
            context.read<FilterController>().findPlaceFilter();
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
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: mocksCategory.length,
                itemBuilder: (context, index) {
                  return CategoryFilterButton(
                    choice: context
                        .watch<FilterController>()
                        .choiceCategory(mocksCategory[index].title),
                    titleCategort: mocksCategory[index].title,
                    assetIconPath: mocksCategory[index].iconPath,
                    onPressed: () {
                      context
                              .read<FilterController>()
                              .choiceCategory(mocksCategory[index].title)
                          ? context
                              .read<FilterController>()
                              .removeCategory(mocksCategory[index].title)
                          : context
                              .read<FilterController>()
                              .addCategory(mocksCategory[index].title);
                      context.read<FilterController>().findPlaceFilter();
                    },
                  );
                },
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
                  context.watch<FilterController>().dimensionString,
                  style: Theme.of(context).textTheme.text16Regular.copyWith(
                        color: Theme.of(context).colorScheme.secondary2,
                      ),
                ),
              ],
            ),
            RangeSlider(
              values: context.watch<FilterController>().range,
              min: 100.0,
              max: 10000.0,
              divisions: 99,
              onChanged: context.read<FilterController>().setRange,
              onChangeEnd: (newValue) {
                context.read<FilterController>().setRange(newValue);
                context.read<FilterController>().findPlaceFilter();
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: context.watch<FilterController>().filtredSights.isEmpty
                  ? null
                  : () {
                      debugPrint(context.read<FilterController>().toString());
                    },
              child: Text(
                '${AppStrings.showButton.toUpperCase()} (${context.watch<FilterController>().filtredSights.length})',
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
