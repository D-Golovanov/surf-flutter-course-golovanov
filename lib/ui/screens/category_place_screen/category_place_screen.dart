import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/strings.dart';
import 'package:places/assets/themes.dart';
import 'package:places/controller/new_place_controller.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/widgets/center_app_bar.dart';
import 'package:provider/provider.dart';

class CategoryPlaceScreen extends StatefulWidget {
  const CategoryPlaceScreen({super.key});

  @override
  State<CategoryPlaceScreen> createState() => _CategoryPlaceScreenState();
}

class _CategoryPlaceScreenState extends State<CategoryPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewPlaceController>(
      builder: (context, value, child) => Scaffold(
        appBar: const CenterAppBar(title: AppStrings.category),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            onPressed:
                value.category.isEmpty ? null : () => Navigator.pop(context),
            child: Text(AppStrings.save.toUpperCase()),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: mocksCategory.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () => value.category = mocksCategory[index].title,
              title: Text(mocksCategory[index].title),
              trailing: value.category == mocksCategory[index].title
                  ? SvgPicture.asset(
                      AppAssets.check,
                      color: Theme.of(context).colorScheme.green,
                    )
                  : null,
            );
          },
          separatorBuilder: (_, __) => const Divider(
            height: 0,
          ),
        ),
      ),
    );
  }
}
