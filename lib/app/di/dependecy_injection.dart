import 'package:get_it/get_it.dart';
import 'package:shawir/app/di/initializer/network/network_initializer.dart';
import 'package:shawir/app/di/initializer/services/services_initializer.dart';

abstract class DependecyInjection {
  static final GetIt instance = GetIt.instance;
  static Future<void> initializeApp() async {
    ServicesInitializer.make();
    NetworkInitializer.make();
  }
}
