import 'package:dio/dio.dart';

//get-post-put-delete methods based on options
//make a object and pass it to api object to start use the methods
class DioMethods {
  DioMethods(this._dio);

  final Dio _dio;

  //GET
  Future<Response> get<T>({
    Map<String, dynamic>? headers,
    required String path,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? queryParameters,
    var data,
  }) =>
      _apiRequest<T>(
        method: "GET",
        path: path,
        data: data,
        headers: headers,
        extra: extra,
        queryParameters: queryParameters,
      );

  //POST
  Future<Response> post<T>({
    Map<String, dynamic>? headers,
    required String path,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? queryParameters,
    var data,
  }) =>
      _apiRequest<T>(
        method: "POST",
        path: path,
        data: data,
        headers: headers,
        extra: extra,
        queryParameters: queryParameters,
      );

  //PUT
  Future<Response> put<T>({
    Map<String, dynamic>? headers,
    required String path,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? queryParameters,
    var data,
  }) =>
      _apiRequest<T>(
        method: "PUT",
        path: path,
        data: data,
        headers: headers,
        extra: extra,
        queryParameters: queryParameters,
      );

  //DELETE
  Future<Response> delete<T>({
    Map<String, dynamic>? headers,
    required String path,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? queryParameters,
    var data,
  }) =>
      _apiRequest<T>(
        method: "DELETE",
        path: path,
        data: data,
        headers: headers,
        extra: extra,
        queryParameters: queryParameters,
      );

  Future<Response> _apiRequest<T>({
    Map<String, dynamic>? headers,
    required String method,
    required String path,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? queryParameters,
    var data,
  }) =>
      _dio.fetch(
        _setStreamType<T>(
          Options(
            method: method,
            headers: headers,
            extra: extra,
          ).compose(
            _dio.options,
            path,
            queryParameters: queryParameters,
            data: data,
          ),
        ),
      );

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
