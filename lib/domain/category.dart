class Category {
  final String title;
  final String iconPath;

  Category({
    required this.title,
    required this.iconPath,
  });

  @override
  String toString() {
    return '$title $iconPath';
  }
}
