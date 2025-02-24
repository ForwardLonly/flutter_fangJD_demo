class ProductModel {
  List<ProductItemModel> result = [];

  ProductModel({required this.result});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      json['result'].forEach((v) {
        result.add( ProductItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['result'] = result.map((v) => v.toJson()).toList();
    return data;
  }
}

class ProductItemModel {
  late int iId;
  late String title;
  late String price;
  late String oldPrice;
  late String pic;

  ProductItemModel({ required this.iId, required this.title, required this.price, required this.oldPrice, required this.pic});

  ProductItemModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    title = json['title'];
    price = json['price'];
    oldPrice = json['old_price'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = iId;
    data['title'] = title;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['pic'] = pic;
    return data;
  }
}