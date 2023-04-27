import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:halcera/presentation/styles/colors.dart';
import 'package:halcera/presentation/styles/font_size.dart';
import 'package:halcera/presentation/styles/fonts.dart';
import 'package:random_avatar/random_avatar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhiteColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Column(
                    children: [
                      /// Location
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SvgPicture.asset('assets/images/map-pin.svg'),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text('London, UK',
                                style: urbanistFontStyle(
                                    color: secondaryFontColor,
                                    fontSize: textSizeL)),
                          )
                        ],
                      ),
                      SizedBox(height: Get.height * .03),

                      /// title
                      Row(
                        children: [
                          RandomAvatar('matea', height: Get.height * .06)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
