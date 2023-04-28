import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:halcera/presentation/styles/colors.dart';
import 'package:halcera/presentation/styles/font_size.dart';
import 'package:halcera/presentation/styles/fonts.dart';

class ApplicationAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const ApplicationAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFFFFFFFF),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFFFFFFF),
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}

class DetailsAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  const DetailsAppBarWidget({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.2,
      title: title != null
          ? Text(
              title!,
              style:
                  urbanistFontStyle(fontSize: h3, fontWeight: FontWeight.w600),
            )
          : null,
      backgroundColor: const Color(0xFFFFFFFF),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFFFFFFF),
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            backgroundColor: secondaryFontColor,
            child: CircleAvatar(
              backgroundColor: primaryWhiteColor,
              child: SvgPicture.asset('assets/images/arrow-right.svg'),
            ),
          ),
        ),
      ),
      toolbarHeight: Get.height * .045,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height * .06);
}
