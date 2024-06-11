import 'package:shawir/domain/models/model.dart';

class SubCategory implements Model {
  final int id;
  final String name;
  SubCategory({required this.id, required this.name});
  @override
  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json['subCategoryId'],
        name: json['subCategoryName'],
      );
  static List<SubCategory> fromList(List list) =>
      list.map((e) => SubCategory.fromJson(e)).toList();
  Map<String, dynamic> toJson() => {
        'subCategoryId': id,
        "subCategoryName": name,
      };
  @override
  bool operator ==(Object other) {
    return other is SubCategory && id == other.id;
  }
  
  @override
  int get hashCode => id;
  
}
