import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/res.dart';
import 'package:places/controller/bottom_navigation_bar_controller.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;

    return Consumer<BottomNavigationBarController>(
      builder: (context, state, _) => BottomNavigationBar(
        currentIndex: state.currentIndex,
        onTap: (value) {
          state.currentIndex = value;
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.list, color: color),
            activeIcon: SvgPicture.asset(AppAssets.listFill, color: color),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.map, color: color),
            activeIcon: SvgPicture.asset(AppAssets.mapFill, color: color),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.favorite, color: color),
            activeIcon: SvgPicture.asset(AppAssets.favoriteFill, color: color),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.settings, color: color),
            activeIcon: SvgPicture.asset(AppAssets.settingsFill, color: color),
            label: '',
          ),
        ],
      ),
    );
  }
}
