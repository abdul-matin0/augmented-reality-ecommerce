import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halcera/infrastructure/services/dependency_service.dart';
import 'package:halcera/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Halcera',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialBinding: DependencyBinding(),
      home: const SplashScreen(),
    );
  }
}
