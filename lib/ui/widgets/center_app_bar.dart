import 'package:flutter/material.dart';
import 'package:places/assets/colors.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/strings.dart';

class CenterAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget bottomWidget;
  final double bottomWidgetHeigth;

  const CenterAppBar({
    super.key,
    required this.title,
    this.bottomWidget = const SizedBox.shrink(),
    this.bottomWidgetHeigth = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.white,
      elevation: 0.0,
      title: const Text(
        AppStrings.appTitleFavorites,
        style: AppTypography.title18CenterAppBar,
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(bottomWidgetHeigth),
        child: bottomWidget,
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + bottomWidgetHeigth);
}
