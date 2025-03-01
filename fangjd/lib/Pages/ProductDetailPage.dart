import 'package:fangjd/CommonWidget/BackgroudButtonWidget.dart';
import 'package:fangjd/Pages/ProductDetail/ProductDetailCommentPage.dart';
import 'package:fangjd/Pages/ProductDetail/ProductDetailDetailPage.dart';
import 'package:fangjd/Pages/ProductDetail/ProductDetailInfoPage.dart';
import 'package:fangjd/Services/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {


  // 显示右上角的menu弹框
  void _showMenuWidget(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(500, 105, 10, 0),
      items: [
        PopupMenuItem(child: Row(
          children: [
            Icon(Icons.home),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0), 
              child: Text("首页"),
            )
          ],
        )),
        PopupMenuItem(child: Row(
          children: [
            Icon(Icons.search),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0), 
              child: Text("搜索"),
            )
          ],
        )),
      ]
    );
  }

  // 底部加入购物车的视图
  Widget _bottomWidget() {
    return Container(
      padding: EdgeInsets.only(top: 5),
      width: Screenadapter.width(750),
      height: Screenadapter.height(160),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.black12
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            width: Screenadapter.width(200),
            child: Column(
              children: [
                Icon(Icons.shopping_cart),
                Text("购物车")
              ],
            ),
          ),
          Expanded(child: BackgroudButtonWidget(
            backgroudColor: Colors.red,
            text: "加入购物车",
            callBack: (){
              print("点击了加入购物车");
            },
          )),
          Expanded(child: BackgroudButtonWidget(
            backgroudColor: Colors.orange,
            text: "立即购买",
            callBack: (){
              print("点击了立即购买");
            },
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            unselectedLabelColor: Colors.black87,
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            dividerHeight: 0.0,
            labelColor: Colors.red,
            tabs: [
              Padding(padding: EdgeInsets.only(top: 10, bottom: 10), child: Text("商品", style: TextStyle(fontSize: 18))),
              Padding(padding: EdgeInsets.only(top: 10, bottom: 10), child: Text("详情", style: TextStyle(fontSize: 18))),
              Padding(padding: EdgeInsets.only(top: 10, bottom: 10), child: Text("评论", style: TextStyle(fontSize: 18))),
            ],
          ),
          actions: [
            IconButton(
              onPressed: (){
                _showMenuWidget(context);
              }, 
              icon: Icon(Icons.more_horiz)
            )
          ],
        ),
        body: Stack(
          children: [
            TabBarView(children: [
              ProductDetailInfoPage(),
              ProductDetailDetailPage(),
              ProductDetailCommentPage()
            ]),
            Positioned(
              bottom: 0.0,
              child: _bottomWidget()
            )
          ],
        ),
      )
    );
  }
}