abstract class ResponseCodeConfig {
  // remote status code
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unauthorized = 401; // failure, user is not authorized
  static const int forbidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404;
  static const int loginError = 404;
  static const int registerIncompleteError = 403;
  static const int emailExistError = 402;

  // local status code
  static const int connectTimeout = -1; //connectTimeout
  static const int cancelled = -2; //cancelled
  static const int receiveTimeout = -3; //receiveTimeout
  static const int sendTimeout = -4; //sendTimeout
  static const int cacheError = -5; //cacheError
  static const int noInternetConnection = -6; //noInternetConnection
  //unknown status code
  static const int unknown = -7; //unknown
}
