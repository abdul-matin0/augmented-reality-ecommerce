import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:halcera/presentation/styles/colors.dart';
import 'package:halcera/presentation/styles/fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      backgroundColor: primaryWhiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/cube_loader.json',
                width: Get.width * .4, height: Get.height * .4),
            Text('H A L C E R A', style: urbanistFontStyle())
          ],
        ),
      ),
    );
  }
}
