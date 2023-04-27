/// Category model
class Category {
  int? id;
  String? title;
  String? description;
  String? imageURL;
  String? videoURL;

  Category({this.id, this.title, this.description, this.imageURL, this.videoURL});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    imageURL = json['imageURL'];
    videoURL = json['videoURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['imageURL'] = imageURL;
    data['videoURL'] = videoURL;
    return data;
  }
}