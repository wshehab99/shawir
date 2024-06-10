import 'package:shawir/domain/models/model.dart';

import '../../app/support/helpers.dart';

class VideoModel implements Model {
  final String data;
  VideoModel(this.data);
  @override
  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      VideoModel(json['data']);
  String get uriFormatted => formateUrl(data);
  Map<String, dynamic> toJson() => {'data': data};
}
