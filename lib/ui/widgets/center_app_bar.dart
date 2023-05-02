import 'package:flutter/material.dart';

class CenterAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget bottomWidget;
  final double bottomWidgetHeigth;
  final Widget actionWidget;

  const CenterAppBar({
    super.key,
    required this.title,
    this.bottomWidget = const SizedBox.shrink(),
    this.bottomWidgetHeigth = 0.0,
    this.actionWidget = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [actionWidget],
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
