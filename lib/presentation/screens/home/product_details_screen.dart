import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:halcera/infrastructure/models/product.dart';
import 'package:halcera/presentation/screens/home/ar_preview_screen.dart';
import 'package:halcera/presentation/styles/colors.dart';
import 'package:halcera/presentation/styles/font_size.dart';
import 'package:halcera/presentation/styles/fonts.dart';
import 'package:halcera/presentation/widgets/application_app_bar_widget.dart';
import 'package:halcera/presentation/widgets/primary_button_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryWhiteColor,
        appBar: const DetailsAppBarWidget(
          title: 'Detail',
        ),
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: Get.height * .02, horizontal: Get.width * .04),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: Get.height * .28,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(imageBorderRadius),
                              child: Image.asset(
                                'assets/images/${product.imageURL}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 14,
                            top: 4,
                            child: GestureDetector(
                              onTap: () => product.glbModelURL != null
                                  ? Get.to(() => ARPreviewScreen(
                                      modelSrc: product.glbModelURL!,
                                      altText: product.title))
                                  : null,
                              child: PrimaryButtonWidget(
                                buttonColor: const Color(0xFFE9ECF0),
                                width: Get.width * .25,
                                height: Get.height * .05,
                                titleWidget: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/ar-box.svg'),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: Text(
                                          '360',
                                          style: urbanistFontStyle(
                                            fontSize: h4,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 14.0),
                        child: Text(
                          product.title ?? '',
                          style: urbanistFontStyle(
                              fontSize: h4, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          product.description ?? '',
                          style: urbanistFontStyle(color: secondaryFontColor),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(color: secondaryFontColor),
                      )
                    ],
                  ),
                ))));
  }
}



class FloatingActionWidget extends StatelessWidget {
  const FloatingActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<TransactionController>(
      builder: (controller) => Visibility(
        visible: controller.onCall.value,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(top: Get.height / 10),
              child: CollapsibleSidebar(
                height: Get.height / 2.3,
                items: TransactionController.items,
                toggleButtonIcon: Icons.arrow_back_ios_new,
                iconSize: 30,
                toggleTitleStyle: montserrat(textStyle: titleMedium(context)),
                textStyle: montserrat(textStyle: titleMedium(context)),
                backgroundColor: white,
                selectedIconColor: black,
                selectedIconBox: white,
                unselectedIconColor: Colors.grey.withOpacity(0.3),
                selectedTextColor: black,
                sidebarBoxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: const Offset(0, 3)),
                ],
                borderRadius: 12,
                avatarImg: null,
                showTitle: false,
                body: const SizedBox(),
              ),
            ),
            Container(
              width: Get.width / 2,
              height: Get.height / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: white,
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
                      Get.to(() => const HomeScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: dangerColor),
                      child: const Icon(
                        Icons.call_end_rounded,
                        color: white,
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
