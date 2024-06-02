import 'package:flutter/material.dart';
import 'package:shawir/presintation/request_expert/views/request_expert_view.dart';
import 'package:shawir/presintation/splash/splash_view.dart';
import 'package:shawir/resources/routing/routes.dart';

abstract class RouteGenrator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.requestExpert:
        return MaterialPageRoute(builder: (_) => const RequestExpertView());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
