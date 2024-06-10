import 'dart:io';

import 'package:dio/dio.dart';

class UploadVideoRequest {
  final File file;
  UploadVideoRequest(this.file);
  Future<FormData> get json async =>
      FormData.fromMap({'video': await MultipartFile.fromFile(file.path)});
}
