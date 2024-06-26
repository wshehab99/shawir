import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shawir/config/api.dart';
import 'package:shawir/data/api/request_expert/request_expert_api.dart';
import 'package:shawir/data/dio/factory.dart';
import 'package:shawir/data/dio/methods.dart';

import '../../data/info/network_info.dart';
import '../../domain/repo/category/category_repo.dart';
import '../../presintation/request_expert/controllers/request_expert_controller.dart';
import '../compressor/compressor.dart';

abstract class DependecyInjection {
  static final GetIt instance = GetIt.instance;
  static Future<void> initializeApp() async {
    await dotenv.load();
    ApiConfig.baseUrl = dotenv.env['APP_URL'] ?? "APP_URL";
    ApiConfig.authToken = dotenv.env['TOKEN'] ?? "TOKEN";
    await GetStorage.init();
    Get.lazyPut<Dio>(() => DioFactory().getDio);
    Get.lazyPut<DioMethods>(() => DioMethods(Get.find<Dio>()));
    Get.lazyPut<CategoryApi>(() => CategoryApi(Get.find<DioMethods>()));
    Get.lazyPut<NetworkInfo>(() => NetworkInfo(InternetConnectionChecker()));
    Get.lazyPut<NetworkInfo>(() => NetworkInfo(InternetConnectionChecker()));
    Get.lazyPut<CategoryRepo>(
        () => CategoryRepo(Get.find<CategoryApi>(), Get.find<NetworkInfo>()));
    Get.lazyPut<RequestExpertController>(
        () => RequestExpertController(Get.find<CategoryRepo>(), Compressor()));
  }
}
