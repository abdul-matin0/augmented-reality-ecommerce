import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:halcera/infrastructure/controller/product_controller.dart';
import 'package:halcera/presentation/screens/home/widgets/banner_carousel_widget.dart';
import 'package:halcera/presentation/screens/home/widgets/home_header_widget.dart';
import 'package:halcera/presentation/screens/home/widgets/product_recommendations_widget.dart';
import 'package:halcera/presentation/styles/colors.dart';
import 'package:halcera/presentation/styles/font_size.dart';
import 'package:halcera/presentation/styles/fonts.dart';
import 'package:halcera/presentation/widgets/application_app_bar_widget.dart';
import 'package:halcera/presentation/widgets/refresh_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return Scaffold(
      backgroundColor: primaryWhiteColor,
      appBar: const ApplicationAppBarWidget(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: RefreshWidget(
            onRefresh: () async {
              Get.find<ProductController>().getListOfProducts();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeHeaderWidget(),

                  /// Carousel Slider
                  BannerCarouselWidget(),

                  /// Recommendation
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * .05,
                        vertical: Get.height * .02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: Get.height * .012),
                          child: Text(
                            'Recommended for you',
                            style: urbanistFontStyle(
                                fontSize: h2, fontWeight: FontWeight.w600),
                          ),
                        ),
                        const ProductRecommendationsWidget()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
