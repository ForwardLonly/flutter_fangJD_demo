import 'package:fangjd/Services/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ProductDetailCommentPage extends StatefulWidget {
  const ProductDetailCommentPage({super.key});

  @override
  State<ProductDetailCommentPage> createState() => _ProductDetailCommentPageState();
}

class _ProductDetailCommentPageState extends State<ProductDetailCommentPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: Screenadapter.height(160)),
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          title: Text("评论人：珠珠"),
          subtitle: Text("这个商品特别的好用，坚持长期使用购买，用完后，会有特别的惊喜，喜欢喜欢喜欢"),
          leading: Icon(Icons.person),
        );
      },
      itemCount: 20,
    );
  }
}