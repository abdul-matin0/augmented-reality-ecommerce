import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:halcera/presentation/styles/colors.dart';
import 'package:halcera/presentation/styles/font_size.dart';
import 'package:halcera/presentation/styles/fonts.dart';
import 'package:random_avatar/random_avatar.dart';

/// Top Main Header
class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
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
                        color: secondaryFontColor, fontSize: textSizeL)),
              )
            ],
          ),
          SizedBox(height: Get.height * .01),

          /// title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  RandomAvatar('r2jx', height: Get.height * .06),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Find your favourite \ndish.',
                      overflow: TextOverflow.fade,
                      style: urbanistFontStyle(
                          fontWeight: FontWeight.w600, fontSize: h1),
                    ),
                  ),
                ],
              ),

              /// Search
              CircleAvatar(
                backgroundColor: secondaryFontColor,
                child: CircleAvatar(
                  backgroundColor: primaryWhiteColor,
                  child: SvgPicture.asset('assets/images/search.svg'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
