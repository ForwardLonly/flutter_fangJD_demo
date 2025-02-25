class CategoryModel {
  late List<CategoryItemModel> result = [];

  CategoryModel({required this.result});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      json['result'].forEach((v) {
        result.add(new CategoryItemModel.fromJson(v));
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
  late int iId;
  late String pic;
  late String title;
  late String pid;
  late String sort;

  CategoryItemModel({required this.iId,  required this.pic, required this.title, required this.pid,  required this.sort});

  CategoryItemModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    pic = json['pic'];
    title = json['title'];
    pid = json['pid'];
    sort = json['sort'];
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