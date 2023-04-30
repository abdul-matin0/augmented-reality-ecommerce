import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

/// application loader
class LoadingWidget extends StatelessWidget {
  final double? width;
  final double? height;
  const LoadingWidget({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/lottie/cube_loader.json',
          width: width ?? Get.width * .4, height: height ?? Get.height * .4),
    );
  }
}
