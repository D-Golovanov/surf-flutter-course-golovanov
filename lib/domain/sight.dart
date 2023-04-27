class Sight {
  final String name;
  final String lat;
  final String lon;
  final String url;
  final String details;
  final String type;

  Sight({
    required this.name,
    required this.lat,
    required this.lon,
    required this.url,
    required this.details,
    required this.type,
  });

  @override
  String toString() {
    return name;
  }
}
