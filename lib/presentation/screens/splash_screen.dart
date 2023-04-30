import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:halcera/presentation/screens/home/home_screen.dart';
import 'package:halcera/presentation/styles/colors.dart';
import 'package:halcera/presentation/styles/fonts.dart';
import 'package:halcera/presentation/widgets/loading_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      Timer(const Duration(seconds: 3), () {
          Get.off(() => const HomeScreen());
        });
    return Scaffold(
      backgroundColor: primaryWhiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoadingWidget(),
            Text('H A L C E R A', style: urbanistFontStyle())
          ],
        ),
      ),
    );
  }
}
