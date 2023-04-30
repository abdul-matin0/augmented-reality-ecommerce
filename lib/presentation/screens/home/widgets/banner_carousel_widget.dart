import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halcera/infrastructure/controller/application_placeholder_controller.dart';
import 'package:halcera/presentation/styles/colors.dart';
import 'package:halcera/presentation/styles/font_size.dart';
import 'package:halcera/presentation/styles/fonts.dart';
import 'package:halcera/presentation/widgets/primary_button_widget.dart';

class BannerCarouselWidget extends StatelessWidget {
  BannerCarouselWidget({super.key});
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * .024),
      child: SizedBox(
        width: double.infinity,
        child: GetBuilder<ApplicationPlaceholderController>(
            builder: (applicationController) {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    height: Get.size.height * 0.23,
                    viewportFraction: 0.9,
                    autoPlay: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.15,
                    autoPlayInterval: const Duration(seconds: 3),
                    onPageChanged: (index, reason) {
                      applicationController.currentBannerCarouselIndex = index;
                      applicationController.update();
                    }),
                items: applicationController.listOfBanners.map((banner) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(horizontal: Get.width * .01),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(imageBorderRadius),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/${banner.imageURL.toString()}'),
                                fit: BoxFit.cover)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Get.width * .045, top: Get.height * .042),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// title
                              Text(banner.title,
                                  style: urbanistFontStyle(
                                      color: banner.titleColor)),

                              /// subtitle
                              Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(banner.subtitle,
                                      style: urbanistFontStyle(
                                          color: banner.subtitleColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: h2))),

                              /// button
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: PrimaryButtonWidget(
                                    text: banner.buttonText,
                                    isPrimaryButton: false,
                                    fontSize: h3,
                                    height: 50,
                                    width: Get.width * .35),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: applicationController.listOfBanners
                      .asMap()
                      .entries
                      .map((entry) {
                    bool isCurrentIndex =
                        applicationController.currentBannerCarouselIndex ==
                            entry.key;
                    return GestureDetector(
                      onTap: () => _carouselController.animateToPage(entry.key),
                      child: Container(
                        width: isCurrentIndex ? 44 : 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.fromLTRB(3.0, 0.0, 3.0, 7.0),
                        decoration: BoxDecoration(
                            shape: isCurrentIndex
                                ? BoxShape.rectangle
                                : BoxShape.circle,
                            color: isCurrentIndex
                                ? secondaryColor
                                : secondaryFontColor,
                            borderRadius: isCurrentIndex
                                ? BorderRadius.circular(8)
                                : null),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
