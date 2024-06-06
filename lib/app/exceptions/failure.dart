import 'api_validation.dart';

class Failure {
  final String message;
  final bool success;
  final ApiValidation error;
  final int status;
  Failure(this.success, this.message, this.error, this.status);

  factory Failure.fromJson(Map<String, dynamic> json, int status) => Failure(
        json["success"] ?? false,
        json["message"] ?? 'unknown',
        ApiValidation.fromJson(
          json["errors"] ?? {},
        ),
        status,
      );
}
