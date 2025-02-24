import 'package:fangjd/Models/FocusModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_swiper_3/flutter_swiper_3.dart';
import 'package:fangjd/Services/ScreenAdapter.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<FocusItemModel> _focusItemList = [];

  @override
  void initState() {
    super.initState();
    // 获取轮播图的数据
    _getSwipterDataRequest();
  }

  // 获取轮播图的数据
  void _getSwipterDataRequest() async {
    final url = Uri.parse('https://resources.ninghao.net/demo/posts.json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      FocusModel focusM = FocusModel.fromJson(responseBody);
      setState(() {
        _focusItemList = focusM.posts;
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
      return Text("加载中");
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
                child: Image.network('https://www.itying.com/images/flutter/hot${index+1}.jpg'),
              ),
              Container(
                padding: EdgeInsets.only(top: Screenadapter.width(10)),
                height:Screenadapter.height(44) ,
                child: Text('第$index条'),
              )
            ],
          );
        },
        itemCount: 10,
      ),
    );
  }

  // 热门推荐
  Widget _hotRecommentWidget() {
    return Container(
      padding: EdgeInsets.all(Screenadapter.width(20)),
      child: Wrap(
        runSpacing: Screenadapter.width(20),
        spacing: Screenadapter.width(20),
        children: [
          _hotRecommentItemWidget(),
          _hotRecommentItemWidget(),
          _hotRecommentItemWidget(),
          _hotRecommentItemWidget(),
          _hotRecommentItemWidget(),
          _hotRecommentItemWidget(),
          _hotRecommentItemWidget(),
          _hotRecommentItemWidget(),
          _hotRecommentItemWidget(),
          _hotRecommentItemWidget(),
        ],
      ),
    );
  }

  Widget _hotRecommentItemWidget() {
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
            child: Image.network('https://www.itying.com/images/flutter/list1.jpg', fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.only(top: Screenadapter.height(20)),
            child: Text(
              '2019年夏季新款气质高贵洋气阔太太修身有女人味中长款宽松的游泳群',
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
                    '￥188',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '￥124',
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
    return ListView(
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
    );
  }
}
