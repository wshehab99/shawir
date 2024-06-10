import 'package:shawir/domain/models/model.dart';

class Professions implements Model {
  final int professionId;
  final String professionName;
  Professions(this.professionId, this.professionName);
  @override
  factory Professions.fromJson(Map<String, dynamic> json) => Professions(
        json['professionId'],
        json['professionName'],
      );
  static List<Professions> fromList(List list) =>
      list.map((e) => Professions.fromJson(e)).toList();
  Map<String, dynamic> toJson() => {
        'professionId': professionId,
        "professionName": professionName,
      };
}
