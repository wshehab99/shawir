import 'package:shawir/domain/models/model.dart';

import '../../app/support/helpers.dart';

class Document implements Model {
  final String documentUri;
  Document(this.documentUri);
  @override
  factory Document.fromJson(Map<String, dynamic> json) =>
      Document(json['documentUri']);
  String get uriFormatted => formateUrl(documentUri);
  Map<String, dynamic> toJson() => {'documentUri': documentUri};
 static  List<Document> fromList(List list) =>
      list.map((e) => Document.fromJson(e)).toList();
}
