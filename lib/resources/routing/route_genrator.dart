import 'package:flutter/material.dart';
import 'package:shawir/presintation/request_expert/views/education_profs_view.dart';
import 'package:shawir/presintation/request_expert/views/experience_certificates_view.dart';
import 'package:shawir/presintation/request_expert/views/photo_id_view.dart';
import 'package:shawir/presintation/request_expert/views/request_expert_view.dart';
import 'package:shawir/presintation/splash/splash_view.dart';
import 'package:shawir/resources/routing/routes.dart';

abstract class RouteGenrator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.experienceCertificates:
        return MaterialPageRoute(
            builder: (_) => const ExperienceCertificatesView());

      case Routes.educationProfs:
        return MaterialPageRoute(builder: (_) => const EducationProfsView());
      case Routes.photoId:
        return MaterialPageRoute(builder: (_) => const PhotoIdView());
      case Routes.requestExpert:
        return MaterialPageRoute(builder: (_) => RequestExpertView());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
