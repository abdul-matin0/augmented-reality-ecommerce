import 'package:halcera/infrastructure/models/category.dart';

/// Produdct model class
class Product {
  int? id;
  String? title;
  String? description;
  double? price;
  String? imageURL;
  String? imageDescriptionURL;
  String? glbModelURL;
  String? videoURL;
  int? categoryId;
  Category? category;

  Product(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.imageURL,
      this.categoryId,
      this.category,
      this.glbModelURL});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    imageURL = json['imageURL'];
    glbModelURL = json['glbModelURL'];
    categoryId = json['categoryId'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['imageURL'] = imageURL;
    data['categoryId'] = categoryId;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}
