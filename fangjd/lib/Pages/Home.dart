import 'package:fangjd/Services/DioRequest.dart';
import 'package:flutter/material.dart';
// 网络请求
import 'dart:convert';

import 'package:flutter_swiper_3/flutter_swiper_3.dart';
import 'package:fangjd/Services/ScreenAdapter.dart';
import 'package:fangjd/Models/FocusModel.dart';
import 'package:fangjd/Models/ProductModel.dart';
import 'package:fangjd/CommonWidget/SearchUnInputWiget.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  final dioRequest = Diorequest();
  List<FocusItemModel> _focusItemList = [];
  List<ProductItemModel> _guessYouLikeList = [];
  List<ProductItemModel> _hotRecommendList = [];

  // 保持页面状态的设置
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // 获取轮播图的数据
    _getSwipterDataRequest();
    // 获取猜你喜欢的数据
    _getGuessYouLikeDataRequest();
    // 获取热门推荐的数据
    _getHotRecommendDataRequest();
  }

  // 获取轮播图的数据
  void _getSwipterDataRequest() async {
    final response = await dioRequest.dio.get('https://resources.ninghao.net/demo/posts.json');
    if (response.statusCode == 200) {
      FocusModel focusM = FocusModel.fromJson(response.data);
      setState(() {
        _focusItemList = focusM.posts;
      });
    }
    
  }

  // 获取猜你喜欢的数据
  void _getGuessYouLikeDataRequest() async {
    final response = await dioRequest.dio.get(
      'https://jdmall.itying.com/api/plist?is_hot=1'
    );
    if (response.statusCode == 200) {
      final data = response.data;
      ProductModel productM = ProductModel.fromJson(data);
      setState(() {
        _guessYouLikeList = productM.result;
      });
    } else {
      print('请求失败');
      setState(() {
      });
    }
  }

  // 获取热门推荐的数据
  void _getHotRecommendDataRequest() async {
    final response = await dioRequest.dio.get(
      'https://jdmall.itying.com/api/plist?is_best=1'
    );
    if (response.statusCode == 200) {
      final data = response.data;
      ProductModel productM = ProductModel.fromJson(data);
      setState(() {
        _hotRecommendList = productM.result;
      });
    } else {
      print('请求失败');
      setState(() {
      });
    }
  }

  // 轮播图的设置
  Widget _swiperWidget() {
    if (_focusItemList.isNotEmpty) {
      return AspectRatio(
        aspectRatio: 2 / 1,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              _focusItemList[index].imageUrl,
              fit: BoxFit.fill,
            );
          },
          itemCount: _focusItemList.length,
          pagination: SwiperPagination(),
          autoplay: true,
        ),
      );
    } else {
      return AspectRatio(aspectRatio: 2/1, child: Center(child: Text("加载中")));
    }
  }

  // 标题组件
  Widget _titleWidget(String text) {
    return Container(
      height: Screenadapter.height(32),
      margin: EdgeInsets.only(left: Screenadapter.width(20)),
      padding: EdgeInsets.only(left: Screenadapter.width(20)),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.red, width: Screenadapter.width(12))
        )
      ),
      child: Text(text, style: TextStyle(color: Colors.black54)),
    );
  }

  // 猜你喜欢的视图
  Widget _guessYouLikeWidget() {
    if (_guessYouLikeList.isNotEmpty) {
      return Container(
        height: Screenadapter.height(210),
        padding: EdgeInsets.only(left: Screenadapter.width(20), top: Screenadapter.width(20), right: Screenadapter.width(20)),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  height: Screenadapter.height(140),
                  width: Screenadapter.height(140),
                  margin: EdgeInsets.only(left: Screenadapter.width(10) ,right: Screenadapter.width(10)),
                  child: Image.network(_guessYouLikeList[index].pic),
                ),
                Container(
                  padding: EdgeInsets.only(top: Screenadapter.width(10)),
                  height:Screenadapter.height(44) ,
                  width: Screenadapter.height(140),
                  child: Text(_guessYouLikeList[index].title, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, ),
                )
              ],
            );
          },
          itemCount: _guessYouLikeList.length,
        ),
      );
    } else {
      // 设置默认数据
      return Container(
        height: Screenadapter.height(210),
        padding: EdgeInsets.only(left: Screenadapter.width(20), top: Screenadapter.width(20), right: Screenadapter.width(20)),
        child: Center(child: Text("加载中..."),),
      );  
    }
    
  }

  // 热门推荐
  Widget _hotRecommentWidget() {
    return Container(
      padding: EdgeInsets.all(Screenadapter.width(20)),
      child: Wrap(
        runSpacing: Screenadapter.width(20),
        spacing: Screenadapter.width(20),
        children: _hotRecommendList.map((value){
          return _hotRecommentItemWidget(value);
        }).toList(),
      ),
    );
  }

  Widget _hotRecommentItemWidget(ProductItemModel itemModel) {
    double itemWidth = (Screenadapter.screenWidth() - Screenadapter.width(60)) / 2;
    return Container(
      width: itemWidth,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12, 
          width: 1
        )
      ),
      padding: EdgeInsets.all(Screenadapter.width(10)),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.network(itemModel.pic, fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.only(top: Screenadapter.height(20)),
            child: Text(
              itemModel.title,
              style: TextStyle(
                color: Colors.black87, 
                fontSize: 16,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Screenadapter.height(10)),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '￥${itemModel.price}',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    itemModel.oldPrice,
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Searchuninputwiget(),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.center_focus_weak)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.message))
        ],
      ),
      body: ListView(
        children: [
          _swiperWidget(),
          SizedBox(height: Screenadapter.height(20)),
          _titleWidget("猜你喜欢"),
          SizedBox(height: Screenadapter.height(20)),
          _guessYouLikeWidget(),
          SizedBox(height: Screenadapter.height(20)),
          _titleWidget("热门推荐"),
          SizedBox(height: Screenadapter.height(10)),
          _hotRecommentWidget()
        ],
      ),
    );
  }
}
