import '../../domain/models/professions.dart';

class ProfessionsResponse {
  final bool isStatus;
  final List<Professions> data;
  ProfessionsResponse({this.isStatus = false, required this.data});
  factory ProfessionsResponse.fromJson(Map<String, dynamic> json) =>
      ProfessionsResponse(data: Professions.fromList(json['data']));
}
