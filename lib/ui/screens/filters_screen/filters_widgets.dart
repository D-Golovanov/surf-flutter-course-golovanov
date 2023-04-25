import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/res.dart';
import 'package:places/assets/themes.dart';

class CategoryFilterButton extends StatelessWidget {
  final String choice;
  final String titleCategort;
  final String assetIconPath;
  final VoidCallback onPressed;

  const CategoryFilterButton({
    super.key,
    required this.assetIconPath,
    required this.titleCategort,
    required this.choice,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Stack(children: [
          Container(
            width: 64.0,
            height: 64.0,
            decoration: BoxDecoration(
              color: theme.colorScheme.green.withOpacity(0.16),
              borderRadius: BorderRadius.circular(32.0),
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: SvgPicture.asset(
                assetIconPath,
                color: theme.colorScheme.green,
              ),
            ),
          ),
          if (choice.isNotEmpty)
            Positioned(
              right: 0.0,
              bottom: 0.0,
              child: IgnorePointer(
                child: SvgPicture.asset(
                  theme.brightness == Brightness.light
                      ? AppAssets.filterCheckLight
                      : AppAssets.filterCheckDark,
                ),
              ),
            ),
        ]),
        const SizedBox(height: 12.0),
        Text(
          titleCategort,
          style: theme.textTheme.superSmall12Regular,
        ),
      ],
    );
  }
}
