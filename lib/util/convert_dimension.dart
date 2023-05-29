import 'package:places/assets/strings.dart';

String convertDimension(double value) {
  final untils = value > 999.0 ? AppStrings.kilometers : AppStrings.meters;
  final dim = value > 999.0 ? (value / 1000).toStringAsFixed(1) : value.toInt();

  return '$dim $untils';
}
