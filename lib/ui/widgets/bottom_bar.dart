import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/res.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;

    return BottomNavigationBar(
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
    );
  }
}
