import 'package:fangjd/Services/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ProductDetailDetailPage extends StatefulWidget {
  const ProductDetailDetailPage({super.key});

  @override
  State<ProductDetailDetailPage> createState() => _ProductDetailDetailPageState();
}

class _ProductDetailDetailPageState extends State<ProductDetailDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: Screenadapter.height(160)),
      child: Center(child: Text("我是详情页面"),),
    );
  }
}