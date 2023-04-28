
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:halcera/infrastructure/controller/product_controller.dart';
import 'package:halcera/presentation/widgets/product_card_widget.dart';

class ProductRecommendationsWidget extends StatelessWidget {
  const ProductRecommendationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        builder: (productController) {
      return StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 18,
        crossAxisSpacing: 10,
        children:
            productController.listOfProducts.map((product) => ProductCardWidget(product: product)).toList(),
      );
    });
  }
}
