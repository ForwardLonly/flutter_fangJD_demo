import 'package:fangjd/Services/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ProductlistPage extends StatefulWidget {
  const ProductlistPage({super.key});

  @override
  State<ProductlistPage> createState() => _ProductlistPageState();
}

class _ProductlistPageState extends State<ProductlistPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectIndex = 1;

  Border _selectHeaderBoder() {
    return Border(
      bottom: BorderSide(
        width: 1,
        color: Colors.red
      )
    );
  }

  // 筛选导航栏
  Widget _subHeaderWidget() {
    return Positioned(
      top: 0.0,
      child: Container(
        height: Screenadapter.height(80),
        width: Screenadapter.screenWidth(),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectIndex = 1;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: _selectIndex == 1 ? _selectHeaderBoder() : null
                  ),
                  child: Center(child: Text("综合", style: TextStyle(color: _selectIndex == 1 ? Colors.red : Colors.black))),
                ),
              )
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectIndex = 2;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: _selectIndex == 2 ? _selectHeaderBoder() : null
                  ),
                  child: Center(child: Text("销量", style: TextStyle(color: _selectIndex == 2 ? Colors.red : Colors.black))),
                ),
              )
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectIndex = 3;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: _selectIndex == 3 ? _selectHeaderBoder() : null
                  ),
                  child: Center(child: Text("价格", style: TextStyle(color: _selectIndex == 3 ? Colors.red : Colors.black))),
                ),
              )
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectIndex = 4;
                  });
                  _scaffoldKey.currentState?.openEndDrawer();
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: _selectIndex == 4 ? _selectHeaderBoder() : null
                  ),
                  child: Center(child: Text("筛选", style: TextStyle(color: _selectIndex == 4 ? Colors.red : Colors.black))),
                ),
              )
            ),
          ],
        ),
      )
    );
  }

  // 商品列表
  Widget _productListWidget() {
    return  Container(
      padding: EdgeInsets.all(Screenadapter.width(10)),
      margin: EdgeInsets.only(top: Screenadapter.height(80)),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(Screenadapter.width(20)),
                    width: Screenadapter.width(220),
                    height: Screenadapter.height(220),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network('https://www.itying.com/images/flutter/hot5.jpg', fit: BoxFit.cover)
                    ),
                  ),
                  Expanded(child: Container(
                    height: Screenadapter.height(220),
                    padding: EdgeInsets.only(top: Screenadapter.height(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "艾伦伯顿（Alen Botun）跑步运动套装男宽松晨跑速干衣体育田径骑行训练马拉松健身房冬季 五件套-四季搭配 XL",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: Screenadapter.height(20)),
                        Container(
                          height: Screenadapter.height(36),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                height: Screenadapter.height(40),
                                width: Screenadapter.width(80),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Screenadapter.height(18)),
                                  color: Colors.black12
                                ),
                                child: Center(child: Text(' 4G ', style: TextStyle(color: Colors.black87))),
                              ),
                              SizedBox(width: Screenadapter.width(20)),
                              Container(
                                height: Screenadapter.height(40),
                                width: Screenadapter.width(80),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Screenadapter.height(18)),
                                  color: Colors.black12
                                ),
                                child: Center(child: Text(' 126 ', style: TextStyle(color: Colors.black87))),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Screenadapter.width(20)),
                        Text("￥189", style: TextStyle(color: Colors.red, fontSize: 18),)
                      ]
                    )
                  ))
                ],
              ),
              Divider(height: Screenadapter.height(2))
            ],
          );
        },
        itemCount: 10
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("商品分类"),
        actions: [
          // 去掉’endDrawer‘默认设置的图标
          Text("")
        ],
      ),
      endDrawer: Drawer(
        child: Center(child: Text("我是侧边栏")),
      ),
      body: Stack(
        children: [
          // 筛选导航栏
          _subHeaderWidget(),
          // 商品列表
          _productListWidget()
        ],
      ),
    );
  }
}