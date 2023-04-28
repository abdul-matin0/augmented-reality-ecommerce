import 'package:get/get.dart';
import 'package:halcera/infrastructure/models/product.dart';

/// Products controller
class ProductController extends GetxController {
  List<Product> listOfProducts = [
    Product(
        imageURL: 'productone.png',
        title: 'Fried Eggs',
        description:
            'Fried eggs, rice and coleslaw with choice of protein, side and a drink.',
        price: 5.00),
    Product(imageURL: 'producttwo.png', title: 'Green Pasta', price: 17.99),
    Product(imageURL: 'productthree.png', title: 'Apple Pie', price: 9.99),
    Product(
        imageURL: 'productfour.png', title: 'Potato with Salad', price: 12.35),
  ];
}
