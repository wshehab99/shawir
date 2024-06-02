import '../di/dependecy_injection.dart';

T sl<T>() => DependecyInjection.instance<T>();
void registerLazy<T extends Object>(T Function() factoryFunc) =>
    DependecyInjection.instance.registerLazySingleton<T>(factoryFunc);
void register<T extends Object>(T Function() factoryFunc) =>
    DependecyInjection.instance.registerFactory<T>(factoryFunc);
