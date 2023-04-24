import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/strings.dart';
import 'package:places/assets/themes.dart';
import 'package:places/controller/theme_controller.dart';
import 'package:places/ui/widgets/center_app_bar.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CenterAppBar(title: AppStrings.titleAppBarSettings),
      body: Column(
        children: [
          const SizedBox(height: 24.0),
          ListTile(
            title: Text(
              AppStrings.darkThtme,
              style: Theme.of(context)
                  .textTheme
                  .text16Regular
                  .copyWith(color: Theme.of(context).colorScheme.textColor),
            ),
            trailing: CupertinoSwitch(
              activeColor: Theme.of(context).colorScheme.green,
              trackColor: Theme.of(context).colorScheme.secondary2Opacity,
              value: context.read<ThemeController>().isDarkTheme,
              onChanged: (onChanged) {
                context.read<ThemeController>().isDarkTheme = onChanged;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              height: 0.8,
              color: Theme.of(context).colorScheme.secondary2Opacity,
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text(
              AppStrings.watchTutorial,
              style: Theme.of(context)
                  .textTheme
                  .text16Regular
                  .copyWith(color: Theme.of(context).colorScheme.textColor),
            ),
            trailing: SvgPicture.asset(
              AppAssets.info,
              color: Theme.of(context).colorScheme.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              height: 0.8,
              color: Theme.of(context).colorScheme.secondary2Opacity,
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const BottomBar(),
    );
  }
}
