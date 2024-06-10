import 'package:shawir/domain/models/model.dart';

class Languages implements Model {
  final int langId;
  final String langName;
  Languages(this.langId, this.langName);
  @override
  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        json['langId'],
        json['langName'],
      );
  static List<Languages> fromList(List list) =>
      list.map((e) => Languages.fromJson(e)).toList();
  Map<String, dynamic> toJson() => {
        'langId': langId,
        "langName": langName,
      };
}
