import 'package:fangjd/Services/ImageUrl.dart';

class CategoryModel {
  late List<CategoryItemModel> result = [];

  CategoryModel({required this.result});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      json['result'].forEach((v) {
        result.add(CategoryItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['result'] = result.map((v) => v.toJson()).toList();
    return data;
  }
}

class CategoryItemModel {
  late String iId;
  late String pic;
  late String title;
  late String pid;
  late String sort;

  CategoryItemModel({required this.iId,  required this.pic, required this.title, required this.pid,  required this.sort});

  CategoryItemModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'].toString();
    pic = Imageurl.getUrl(json['pic'].toString());
    title = json['title'].toString();
    pid = json['pid'].toString();
    sort = json['sort'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = iId;
    data['pic'] = pic;
    data['title'] = title;
    data['pid'] = pid;
    data['sort'] = sort;
    return data;
  }
}