
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halcera/infrastructure/controller/product_controller.dart';
import 'package:halcera/presentation/styles/colors.dart';

class FloatingActionWidget extends StatelessWidget {
  const FloatingActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ProductController>(
      builder: (controller) => Visibility(
        visible: controller.onCall.value,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: Get.width / 2,
              height: Get.height / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: primaryWhiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(children: [
                AgoraVideoViewer(
                  client: controller.client,
                  layoutType: Layout.floating,
                  showNumberOfUsers: true,
                ),
                AgoraVideoButtons(
                  client: controller.client,
                  verticalButtonPadding: 10,
                  autoHideButtonTime: 10,
                  autoHideButtons: true,
                  disconnectButtonChild: InkWell(
                    onTap: () {
                      controller.onCall.value = false;
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: dangerColor),
                      child: const Icon(
                        Icons.call_end_rounded,
                        color: primaryWhiteColor,
                      ),
                    ),
                  ),
                  enabledButtons: const [
                    BuiltInButtons.toggleCamera,
                    BuiltInButtons.callEnd,
                    BuiltInButtons.toggleMic
                  ],
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
