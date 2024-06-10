import 'package:shawir/domain/models/languages.dart';

class LanguagesResponse {
  final bool isStatus;
  final List<Languages> data;
  LanguagesResponse({this.isStatus = false, required this.data});
  factory LanguagesResponse.fromJson(Map<String, dynamic> json) =>
      LanguagesResponse(data: Languages.fromList(json['data']));
}
