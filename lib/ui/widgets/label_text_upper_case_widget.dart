import 'package:flutter/material.dart';
import 'package:places/assets/text_style.dart';
import 'package:places/assets/themes.dart';

class LabelTextUpperCaseWidget extends StatelessWidget {
  final String text;
  const LabelTextUpperCaseWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: AppTypography.superSmall12Regular.copyWith(
        color: Theme.of(context).colorScheme.secondary2Opacity,
      ),
    );
  }
}
