import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shawir/data/api/category/category_api.dart';
import 'package:shawir/data/dio/factory.dart';
import 'package:shawir/data/dio/methods.dart';

import '../../data/info/network_info.dart';
import '../../domain/repo/category/category_repo.dart';
import '../../presintation/request_expert/controllers/request_expert_controller.dart';

abstract class DependecyInjection {
  static final GetIt instance = GetIt.instance;
  static Future<void> initializeApp() async {
    Get.lazyPut<Dio>(() => DioFactory().getDio);
    Get.lazyPut<DioMethods>(() => DioMethods(Get.find<Dio>()));
    Get.lazyPut<CategoryApi>(() => CategoryApi(Get.find<DioMethods>()));
    Get.lazyPut<NetworkInfo>(() => NetworkInfo(InternetConnectionChecker()));
    Get.lazyPut<CategoryRepo>(
        () => CategoryRepo(Get.find<CategoryApi>(), Get.find<NetworkInfo>()));
    Get.lazyPut<RequestExpertController>(
        () => RequestExpertController(Get.find<CategoryRepo>()));
  }
}
