import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:halcera/infrastructure/models/product.dart';
import 'package:halcera/presentation/styles/font_size.dart';
import 'package:halcera/presentation/styles/fonts.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  final double? height;
  const ProductCardWidget({super.key, required this.product, this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(imageBorderRadius),
            child: Image.asset('assets/images/${product.imageURL}',
                fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: Get.height * .01),
          child: Text(product.title ?? '',
              style:
                  urbanistFontStyle(fontSize: h4, fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: EdgeInsets.only(top: Get.height * .005),
          child: Text(
            '£${product.price}',
            style: urbanistFontStyle(),
          ),
        )
      ],
    );
  }
}
