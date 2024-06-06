import 'package:dio/dio.dart';

import '../../config/error_data_source.dart';
import 'failure.dart';

//handle errors on app & api
class Handler implements Exception {
  late Failure failure;

  Handler.handle(error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = ErrorDataSourceConfig.unknown.getFailure;
    }
  }
}

Failure _handleError(DioException error) {
  //get failure object from api response
  return Failure.fromJson(
    error.response?.data ?? {},
    error.response?.statusCode ?? -7,
  );
}
