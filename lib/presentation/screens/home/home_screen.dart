import 'package:flutter/material.dart';
import 'package:halcera/presentation/screens/home/widgets/banner_carousel_widget.dart';
import 'package:halcera/presentation/screens/home/widgets/home_header_widget.dart';
import 'package:halcera/presentation/styles/colors.dart';
import 'package:halcera/presentation/widgets/application_app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhiteColor,
      appBar: const ApplicationAppBarWidget(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const HomeHeaderWidget(),

                /// Carousel Slider
                BannerCarouselWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
