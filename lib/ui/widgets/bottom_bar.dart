import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/colors.dart';
import 'package:places/assets/res.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.list,
            color: AppColors.secondary,
          ),
          label: 'null',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.map,
            color: AppColors.secondary,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.favorite,
            color: AppColors.secondary,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.settings,
            color: AppColors.secondary,
          ),
          label: '',
        ),
      ],
    );
  }
}
