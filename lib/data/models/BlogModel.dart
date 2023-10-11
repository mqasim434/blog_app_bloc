

class BlogModel {
  BlogModel({
      this.id,
      this.image_url,
      this.title,
  });

  BlogModel.fromJson(dynamic json) {
    id = json['id'];
    image_url = json['image_url'];
    title = json['title'];
  }

  String? id;
  String? image_url;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image_url'] = image_url;
    map['title'] = title;
    return map;
  }

}