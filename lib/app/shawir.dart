import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shawir/resources/routing/route_genrator.dart';
import 'package:shawir/resources/routing/routes.dart';

import '../resources/theme/theme_manager.dart';

class Shawir extends StatelessWidget {
  const Shawir({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateRoute: RouteGenrator.onGenerateRoute,
      initialRoute: Routes.splash,
      theme: ThemeManager.theme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
