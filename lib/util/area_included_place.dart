import 'dart:math';

import 'package:places/domain/location.dart';

bool areaIncludedPlace(
  Location currentPosition,
  Location targetPosition,
  double fromPlace,
  double toPlace,
) {
  const earthR = 6372795.0;
  //координаты в радианы
  final targetLat = double.parse(targetPosition.latitude) * pi / 180;
  final currentLat = double.parse(currentPosition.latitude) * pi / 180;
  final targetLon = double.parse(targetPosition.longitude) * pi / 180;
  final currentLon = double.parse(currentPosition.longitude) * pi / 180;

  // косинусы и синусы широт и разницы долгот
  final cosTgLat = cos(targetLat);
  final cosCurLat = cos(currentLat);
  final sinTgLat = sin(targetLat);
  final sinCurLat = sin(currentLat);

  final delta = currentLon - targetLon;
  final cosDelta = cos(delta);
  final sinDelta = sin(delta);

  // вычисления длины большого круга
  final y = sqrt(pow(cosCurLat * sinDelta, 2) +
      pow(cosTgLat * sinCurLat - sinTgLat * cosCurLat * cosDelta, 2));
  final x = sinTgLat * sinCurLat + cosTgLat * cosCurLat * cosDelta;

  final ad = atan2(y, x);
  final dist = (ad * earthR).round();

  return dist >= fromPlace && dist <= toPlace;
}
