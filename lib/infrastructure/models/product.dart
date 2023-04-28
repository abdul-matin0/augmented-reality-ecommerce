import 'package:halcera/infrastructure/models/category.dart';

/// Produdct model class
class Product {
  int? id;
  String? title;
  String? description;
  double? price;
  String? imageURL;
  String? videoURL;
  int? categoryId;
  Category? category;

  Product(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.imageURL,
      this.videoURL,
      this.categoryId,
      this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    imageURL = json['imageURL'];
    videoURL = json['videoURL'];
    categoryId = json['categoryId'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['imageURL'] = imageURL;
    data['videoURL'] = videoURL;
    data['categoryId'] = categoryId;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}
