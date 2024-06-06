class Category {
  final int id;
  final int countExperts;
  final String name;
  final String icon;
  final String color;
  Category({
    required this.id,
    required this.name,
    required this.countExperts,
    required this.color,
    required this.icon,
  });
  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['mainCategoryId'],
        name: json['mainCategoryName'],
        countExperts: json['countExperts'],
        color: json['color'],
        icon: json['icon'],
      );
  static List<Category> fromList(List list) =>
      list.map((e) => Category.fromJson(e)).toList();
}
