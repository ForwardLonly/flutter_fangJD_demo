
class FocusModel {
  List<FocusItemModel> posts = [];

  FocusModel({required this.posts});

  FocusModel.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      json['posts'].forEach((v) {
        posts.add(FocusItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['posts'] = posts.map((v) => v.toJson()).toList();
    return data;
  }
}

class FocusItemModel {
  late int id;
  late String title;
  late String author;
  late String description;
  late String imageUrl;

  FocusItemModel({required this.id, required  this.title, required this.author,required  this.description,required  this.imageUrl});

  FocusItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['author'] = author;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    return data;
  }
}