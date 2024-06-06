class SubCategory {
  final int id;
  final String name;
  SubCategory({required this.id, required this.name});
  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json['subCategoryId'],
        name: json['subCategoryName'],
      );
  static List<SubCategory> fromList(List list) =>
      list.map((e) => SubCategory.fromJson(e)).toList();
}
