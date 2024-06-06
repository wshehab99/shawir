import 'package:flutter/material.dart';
import 'package:shawir/app/di/dependecy_injection.dart';

import 'app/shawir.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DependecyInjection.initializeApp();
  runApp(const Shawir());
}
