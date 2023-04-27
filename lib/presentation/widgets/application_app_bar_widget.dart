import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
