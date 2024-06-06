import '../app/exceptions/api_validation.dart';
import '../app/exceptions/failure.dart';
import 'response_code.dart';

enum ErrorDataSourceConfig {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancelled,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  unknown
}

//get failure object based on DataSource
extension DataSourceExtension on ErrorDataSourceConfig {
  Failure get getFailure {
    switch (this) {
      case ErrorDataSourceConfig.success:
        return Failure(
          false,
          "success",
          ApiValidation(),
          ResponseCodeConfig.success,
        );
      case ErrorDataSourceConfig.noContent:
        return Failure(
          false,
          "noContent",
          ApiValidation(),
          ResponseCodeConfig.noContent,
        );
      case ErrorDataSourceConfig.badRequest:
        return Failure(
          false,
          "badRequest",
          ApiValidation(),
          ResponseCodeConfig.badRequest,
        );
      case ErrorDataSourceConfig.forbidden:
        return Failure(
          false,
          "forbidden",
          ApiValidation(),
          ResponseCodeConfig.forbidden,
        );
      case ErrorDataSourceConfig.unauthorized:
        return Failure(
          false,
          "unauthorized",
          ApiValidation(),
          ResponseCodeConfig.unauthorized,
        );
      case ErrorDataSourceConfig.notFound:
        return Failure(
          false,
          "notFound",
          ApiValidation(),
          ResponseCodeConfig.notFound,
        );
      case ErrorDataSourceConfig.internalServerError:
        return Failure(
          false,
          "internalServerError",
          ApiValidation(),
          ResponseCodeConfig.internalServerError,
        );
      case ErrorDataSourceConfig.connectTimeout:
        return Failure(
          false,
          "connectTimeout",
          ApiValidation(),
          ResponseCodeConfig.connectTimeout,
        );
      case ErrorDataSourceConfig.cancelled:
        return Failure(
          false,
          "cancelled",
          ApiValidation(),
          ResponseCodeConfig.cancelled,
        );
      case ErrorDataSourceConfig.receiveTimeout:
        return Failure(
          false,
          "receiveTimeout",
          ApiValidation(),
          ResponseCodeConfig.receiveTimeout,
        );
      case ErrorDataSourceConfig.sendTimeout:
        return Failure(
          false,
          "sendTimeout",
          ApiValidation(),
          ResponseCodeConfig.sendTimeout,
        );
      case ErrorDataSourceConfig.cacheError:
        return Failure(
          false,
          "cacheError",
          ApiValidation(),
          ResponseCodeConfig.cacheError,
        );
      case ErrorDataSourceConfig.noInternetConnection:
        return Failure(
          false,
          "no internet connection",
          ApiValidation(),
          ResponseCodeConfig.noInternetConnection,
        );
      case ErrorDataSourceConfig.unknown:
        return Failure(
          false,
          "unknown",
          ApiValidation(),
          ResponseCodeConfig.unknown,
        );
    }
  }
}
