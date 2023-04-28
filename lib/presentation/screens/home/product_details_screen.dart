import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:halcera/infrastructure/models/product.dart';
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
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(imageBorderRadius),
                              child: Image.asset(
                                'assets/images/productdetails.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 14,
                            top: 4,
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
