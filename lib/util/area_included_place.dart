import 'dart:math';

bool areaIncludedPlace(
  String currentPositionLat,
  String currentPositionLon,
  String targetPositionLat,
  String targetPositionLon,
  double fromPlace,
  double toPlace,
) {
  const earthR = 6372795.0;
  //координаты в радианы
  final targetLat = double.parse(targetPositionLat) * pi / 180;
  final currentLat = double.parse(currentPositionLat) * pi / 180;
  final targetLon = double.parse(targetPositionLon) * pi / 180;
  final currentLon = double.parse(currentPositionLon) * pi / 180;

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
