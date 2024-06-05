import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

abstract class DependecyInjection {
  static final GetIt instance = GetIt.instance;
  static Future<void> initializeApp() async {
    // Get.lazyPut(builder);
  }
}
