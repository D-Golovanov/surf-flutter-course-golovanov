import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/assets/themes.dart';

class IconInfo extends StatelessWidget {
  final String iconPath;
  final String title;
  final String description;

  const IconInfo({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 64.0,
              color: Theme.of(context).colorScheme.secondary2Opacity,
            ),
            const SizedBox(height: 24.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle18Medium.copyWith(
                    color: Theme.of(context).colorScheme.secondary2Opacity,
                  ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.small14Regular.copyWith(
                    color: Theme.of(context).colorScheme.secondary2Opacity,
                  ),
            ),
            const SizedBox(height: 36.0),
          ],
        ),
      ),
    );
  }
}
