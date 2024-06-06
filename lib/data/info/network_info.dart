import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfo {
  final InternetConnectionChecker _checker;
  NetworkInfo(this._checker);
  Future<bool> get check => _checker.hasConnection;
}
