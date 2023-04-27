import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halcera/infrastructure/controller/category_controller.dart';
import 'package:halcera/presentation/widgets/loading_widget.dart';

class CategoryCarouselWidget extends StatelessWidget {
  const CategoryCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GetBuilder<CategoryController>(builder: (categoryController) {
        return CarouselSlider(
          options: CarouselOptions(
            height: Get.size.height * 0.28,
            viewportFraction: 1,
            autoPlay: false,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayInterval: const Duration(seconds: 3),
          ),
          items: categoryController.listOfCategories.map((category) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.08),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(1.5, 12),
                      )
                    ],
                  ),
                  child: CachedNetworkImage(
                      imageUrl: category.imageURL.toString(),

                      /// download progress widget
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              const LoadingWidget(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover),
                );
              },
            );
          }).toList(),
        );
      }),
    );
  }
}
