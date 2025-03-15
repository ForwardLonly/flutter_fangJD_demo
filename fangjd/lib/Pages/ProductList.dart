import 'package:fangjd/CommonWidget/LoadingWidget.dart';
import 'package:fangjd/Models/ProductModel.dart';
import 'package:fangjd/Services/DioRequest.dart';
import 'package:fangjd/Services/ScreenAdapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductlistPage extends StatefulWidget {
  final Map arguments;

  const ProductlistPage({super.key, required this.arguments});

  @override
  State<ProductlistPage> createState() => _ProductlistPageState();
}

class _ProductlistPageState extends State<ProductlistPage> {
  final dioRequest = Diorequest();
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
  // 分页数据
  int _papge = 1;
  // 搜索文字的初始化
  final TextEditingController _textEditContr = TextEditingController();

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

    if (widget.arguments["keyword"] != null) {
      _textEditContr.text = widget.arguments["keyword"];
    }

    // -----网络请求--------
    _getProductListDataRequest();
  }

  // -----网络请求--------
  void _reGetProductListDataRequest() {
    _productList = [];
    _isShowMore = false;
    _isHaveMoreData = true;
    _getProductListDataRequest();
  }


  void _getProductListDataRequest() async {
    setState(() {
      _isShowMore = true;
    });

    var apiUrl = 'https://jdmall.itying.com/api/plist?page=$_papge';
    if (widget.arguments["keyword"] != null) {
      apiUrl = "$apiUrl&search=${widget.arguments["keyword"]}";
    }
    if (widget.arguments["cid"] != null) {
      // apiUrl = "$apiUrl&cid=${widget.arguments["cid"]}";
    }
    final response = await dioRequest.dio.get(apiUrl);
    if (response.statusCode == 200) {
      final data = response.data;
      ProductModel productM = ProductModel.fromJson(data);
      setState(() {
        _isShowMore = false;
        _productList.addAll(productM.result);
        if (productM.result.length < 10) {
          _isHaveMoreData = false;
        } else {
          _isHaveMoreData = true;
          _papge ++;
        }
      });
    }
  }

  // -----视图设置--------
  // 设置搜索条
  Widget _searchInputWidget() {
    return Container(
      padding: EdgeInsets.only(left: Screenadapter.width(20)),
      height: Screenadapter.height(80),
      decoration: BoxDecoration(
        color: Color.fromRGBO(233, 233, 233, 0.9),
        borderRadius: BorderRadius.circular(Screenadapter.height(40)),
      ),
      child: TextField(
          controller: _textEditContr,
          autofocus: false,
          decoration: InputDecoration(
            // 设置内容的间距
            contentPadding: EdgeInsets.all(10),
            // 设置图标
            prefixIcon: Icon(Icons.search, size: 18, color: Colors.black45),
            // 设置前置图标的约束
            prefixIconConstraints: BoxConstraints(
                //添加内部图标之后，图标和文字会有间距，实现这个方法，不用写任何参数即可解决
                minWidth: 30.0
            ),
            // 设置提示文字
            hintText: "请输入你想搜索的商品",
            // 设置提示文字的样式
            hintStyle: TextStyle(fontSize: 16, color: Colors.black45),
            // 去掉输入框底部的线
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (value) {
            _textEditContr.text = value;
          },
        ),
    );
  }

  // 设置搜索的按钮
  Widget _searchItemWiget() {
    return InkWell(
      onTap: (){
        _reGetProductListDataRequest();
      },
      child: Container(
        padding: EdgeInsets.only(right: Screenadapter.width(30)),
        height: Screenadapter.height(80),
        width: Screenadapter.width(100),
        child: Center(
          child: Text("搜索", style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }


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
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/productDetail');
                  },
                  child: Row(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("￥${itemModel.price}", style: TextStyle(color: Colors.red, fontSize: 18)),
                                Text("￥${itemModel.oldPrice}", style: TextStyle(color: Colors.black54, fontSize: 16, decoration: TextDecoration.lineThrough))
                              ],
                            )
                          ]
                        )
                      ))
                    ],
                  )
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
        title: _searchInputWidget(),
        actions: [
          _searchItemWiget()
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