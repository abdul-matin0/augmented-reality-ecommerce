import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halcera/presentation/styles/fonts.dart';
import 'package:halcera/presentation/widgets/primary_button_widget.dart';

class ApplicationErrorWidget extends StatelessWidget {
  const ApplicationErrorWidget({super.key, this.message, this.reload});
  final String? message;
  final void Function()? reload;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.cancel,
              color: Color.fromARGB(255, 215, 55, 55), size: 26),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(message ?? 'Error', style: urbanistFontStyle()),
          ),
          PrimaryButtonWidget(
            text: 'Reload',
            onPressed: reload,
            width: Get.width * .5,
          )
        ],
      ),
    );
  }
}
