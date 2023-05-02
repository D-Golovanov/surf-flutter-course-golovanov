import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtonCard extends StatelessWidget {
  final String assetIconPath;
  final VoidCallback onPressed;

  const IconButtonCard({
    super.key,
    required this.assetIconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(),
      onPressed: onPressed,
      icon: SvgPicture.asset(assetIconPath),
    );
  }
}
