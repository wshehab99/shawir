import 'dart:io';

import 'package:dio/dio.dart';

class UpdateAvatarRequest {
  final File file;
  UpdateAvatarRequest(this.file);
  Future<FormData> get json async =>
      FormData.fromMap({'avatar': await MultipartFile.fromFile(file.path)});
}
