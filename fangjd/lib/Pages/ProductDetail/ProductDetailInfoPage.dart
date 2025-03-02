import 'dart:convert';

import 'package:fangjd/CommonWidget/BackgroudButtonWidget.dart';
import 'package:fangjd/Pages/ProductDetail/ProductShowModelBottomSheet.dart';
import 'package:fangjd/Services/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ProductDetailInfoPage extends StatefulWidget {
  const ProductDetailInfoPage({super.key});

  @override
  State<ProductDetailInfoPage> createState() => _ProductDetailInfoPageState();
}

class _ProductDetailInfoPageState extends State<ProductDetailInfoPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, Screenadapter.height(160)),
      child: ListView(
        children: [
          // 图片
          AspectRatio(
            aspectRatio: 16/9,
            child: Image.network("https://img12.360buyimg.com/n1/s450x450_jfs/t1/267804/30/22514/134520/67b7f237F7c736c57/24afe2d97251c17e.jpg", fit: BoxFit.cover),
          ),
          SizedBox(height: 10),
          // 商品的标题
          Text(
            "HALIWEI国行【2025款英特尔+酷睿i7】笔记本电脑高性能金属轻薄本网课学习设计便携商务办公游戏学生手提 【AI终端】英特尔16pro+4K窄边全面屏蓝光级 32GB运存+1TB超速硬盘",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800 
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
          // 商品的详情
          Text(
            "商品名称：HALIWEI国行【2025款英特尔+酷睿i7】笔记本电脑高性能金属轻薄本网课学习设计便携商务办公游戏学生手提 【AI终端】英特尔16pro+4K窄边全面屏蓝光级 32GB运存+1TB超速硬盘商品编号：10107525100533店铺： HALIWEI旗舰店货号：F11屏幕比例：16:9屏幕特性：护眼认证接口支持：HDMI扩展性：4G/5G上网内存容量：32GB处理器(CPU)：intel非酷睿产品形态：翻转，4G/5G上网，超薄(≤14mm)能效等级：一级能效显卡：intel核显",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black45
            ),
          ),
          // 规格
          Container(
            margin: EdgeInsets.only(top: 10),
            height: Screenadapter.height(88),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.black12
                )
              )
            ),
            child: InkWell(
              onTap: (){
                ProductShowModelBottomSheet().showDetailSelectInfoSheet(context);
              },
              child: Row(
                children: [
                  Text("已选：", style: TextStyle(fontWeight: FontWeight.w800)),
                  SizedBox(width: 10),
                  Text("115, 黑色， XL， 1件"),
                ],
              ),
            ),
          ),
          // 运费
          Container(
            margin: EdgeInsets.only(top: 10),
            height: Screenadapter.height(88),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Colors.black12
                )
              )
            ),
            child: Row(
              children: [
                Text("运费：", style: TextStyle(fontWeight: FontWeight.w800)),
                SizedBox(width: 10),
                Text("免运费"),
              ],
            ),
          )
        ],
      ),
    );
  }
}