class Document {
  final String documentUri;
  Document(this.documentUri);
  factory Document.fromJson(Map<String, dynamic> json) =>
      Document(json['documentUri']);
  String get uriFormatted =>
      "http://shawir.app/${documentUri.replaceAll('api/', '')}";
}
