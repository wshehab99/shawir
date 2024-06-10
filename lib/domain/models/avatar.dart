import '../../app/support/helpers.dart';
import 'model.dart';

class ExpertAvatar implements Model {
  final bool isStatus;
  final String data;
  ExpertAvatar(this.isStatus, this.data);
  @override
  factory ExpertAvatar.fromJson(Map<String, dynamic> json) =>
      ExpertAvatar(json['isStatus'], json['data']);
  String get uriFormatted => formateUrl(data);
  Map<String, dynamic> toJson() => {
        'isStatus': isStatus,
        'data': data,
      };
}
