import 'package:flutter/material.dart';
import 'package:places/assets/strings.dart';
import 'package:places/ui/screens/settings_screen/settings_widgets.dart';
import 'package:places/ui/widgets/center_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CenterAppBar(title: AppStrings.titleAppBarSettings),
      body: Column(
        children: const [
          SizedBox(height: 24.0),
          ListTileThemeWidget(),
          PaddingDividerWidget(),
          ListTileTutorialWidget(),
          PaddingDividerWidget(),
        ],
      ),
    );
  }
}
