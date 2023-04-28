import 'package:get/get.dart';
import 'package:halcera/infrastructure/models/category.dart';

class CategoryController extends GetxController {
  List<Category> listOfCategories = [
     Category(
        imageURL: 'placeholderone.png',
        title: 'All',
        description: 'Special discount'),
    Category(
        imageURL: 'placeholderone.png',
        title: 'Burger',
        description: 'Special discount'),
    Category(
        imageURL: 'placeholdertwo.png',
        title: 'Chicken',
        description: 'Special discount')
  ];
}
