import 'package:fangjd/CommonWidget/LoadingWidget.dart';
import 'package:fangjd/Models/ProductModel.dart';
import 'package:fangjd/Services/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ProductlistPage extends StatefulWidget {
  const ProductlistPage({super.key});

  @override
  State<ProductlistPage> createState() => _ProductlistPageState();
}

class _ProductlistPageState extends State<ProductlistPage> {
  // ScaffoldState, 控制侧边栏的显示
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // 筛选导航栏的索引
  int _selectIndex = 1;
  // 商品列表的数据
  List<ProductItemModel> _productList = [];
  // 滚动视图的控制器
  final ScrollController _scrollController = ScrollController();
  // 是否已显示了上拉加载中
  bool _isShowMore = false;
  // 是否有更多的数据
  bool _isHaveMoreData = true;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener((){
      // 内容视图最大的高度
      double maxScrollExtent = _scrollController.position.maxScrollExtent;
      // 视图滚动的大小
      double scrollContentOffY = _scrollController.position.pixels;

      if (scrollContentOffY > maxScrollExtent + Screenadapter.height(40)) {
        // 超出了内容视图高度的20，就重新上拉加载更多
        if (_isShowMore == false && _isHaveMoreData == true) {
          // 未显示
          _getProductListDataRequest();
        }
        
      }
    });

    // -----网络请求--------
    _getProductListDataRequest();
  }

  // -----网络请求--------
  void _getProductListDataRequest() async {
    setState(() {
      _isShowMore = true;
    });
    // 模拟网络延迟
    await Future.delayed(Duration(seconds: 2)); 
    List<ProductItemModel> mockDataList = _mockData();
    setState(() {
      _productList.addAll(mockDataList);
      _isShowMore = false;
      if (_productList.length > 20) {
        _isHaveMoreData = false;
      }
    });
  }

  // 模拟数据
  List<ProductItemModel> _mockData() {
    // return
    List<ProductItemModel> mockList = [];
    for (var index in [1,2,3,4,5,6,7,8,9,0]) {
      var model = ProductItemModel(iId: 1, title: '笔记本电脑$index', price: "￥3980", oldPrice: "￥4999", pic: "https://www.itying.com/images/flutter/hot${index+1}.jpg");
      mockList.add(model);
    }
    return mockList;
  }

  // -----视图设置--------
  // 设置 筛选透视图的底部选中的线
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

  // 商品列表底部的视图
  Widget _productBottomWiget(int index) {
    if (_isHaveMoreData == true) {
      if (_isShowMore && (index == _productList.length -1)) {
        return Loadingwidget();
      } else {
        return SizedBox(height: 1);
      }
    } else {
      if (index == _productList.length -1) {
        return Padding(padding:EdgeInsets.only(top: Screenadapter.height(30)), child: Text("--我也是有底线的--", textAlign: TextAlign.center,));
      } else {
        return SizedBox(height: 1);
      }
    }
  }

  // 商品列表
  Widget _productListWidget() {
    if (_productList.isNotEmpty) {
      return  Container(
        padding: EdgeInsets.all(Screenadapter.width(10)),
        margin: EdgeInsets.only(top: Screenadapter.height(80)),
        child: ListView.builder(
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            ProductItemModel itemModel = _productList[index];
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
                        child: Image.network(itemModel.pic, fit: BoxFit.cover)
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
                            itemModel.title,
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
                          Text(itemModel.price, style: TextStyle(color: Colors.red, fontSize: 18))
                        ]
                      )
                    ))
                  ],
                ),
                Divider(height: Screenadapter.height(2)),
                _productBottomWiget(index)
              ],
            );
          },
          itemCount: _productList.length
        ),
      );
    } else {
      return Loadingwidget();
    }
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