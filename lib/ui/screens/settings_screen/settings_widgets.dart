import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/strings.dart';
import 'package:places/assets/themes.dart';
import 'package:places/controller/theme_controller.dart';
import 'package:provider/provider.dart';

class ListTileTutorialWidget extends StatelessWidget {
  const ListTileTutorialWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      onTap: () {},
      title: Text(
        AppStrings.watchTutorial,
        style: theme.textTheme.text16Regular
            .copyWith(color: theme.colorScheme.textColor),
      ),
      trailing: SvgPicture.asset(
        AppAssets.info,
        color: theme.colorScheme.green,
      ),
    );
  }
}

class PaddingDividerWidget extends StatelessWidget {
  const PaddingDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(
        height: 0.8,
        color: Theme.of(context).colorScheme.secondary2Opacity,
      ),
    );
  }
}

class ListTileThemeWidget extends StatelessWidget {
  const ListTileThemeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      title: Text(
        AppStrings.darkThtme,
        style: theme.textTheme.text16Regular
            .copyWith(color: theme.colorScheme.textColor),
      ),
      trailing: CupertinoSwitch(
        activeColor: theme.colorScheme.green,
        trackColor: theme.colorScheme.secondary2Opacity,
        value: context.read<ThemeController>().isDarkTheme,
        onChanged: (onChanged) {
          context.read<ThemeController>().isDarkTheme = onChanged;
        },
      ),
    );
  }
}
