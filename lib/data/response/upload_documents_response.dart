import 'package:shawir/domain/models/document.dart';

class UploadDocumentsResponse {
  final Document data;
  UploadDocumentsResponse(this.data);
  factory UploadDocumentsResponse.fromJson(Map<String, dynamic> json) =>
      UploadDocumentsResponse(Document.fromJson(json['data']));
}
