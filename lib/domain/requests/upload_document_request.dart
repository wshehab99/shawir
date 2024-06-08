import 'dart:io';

import 'package:dio/dio.dart';

class UploadDocumentRequest {
  File file;
  UploadDocumentRequest(this.file);
  Future<FormData> get json async =>
      FormData.fromMap({'document': await MultipartFile.fromFile(file.path)});
}
