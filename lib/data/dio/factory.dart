import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../../config/api.dart';

//make the dio object based on options for all the app
class DioFactory {
  //dio getter
  Dio get getDio {
    Dio dio = Dio();
    Map<String, String> headers = {
      "Accept": "*/*",
      "Content-Type": "application/json",
      "Connection": "keep-alive",
      "lang": "ar",
    };
    dio.options = BaseOptions(
      //api base url
      baseUrl: ApiConfig.baseUrl,
      headers: headers,
      followRedirects: false,
    );
    if (!kReleaseMode) {
      // its debug mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }
}
