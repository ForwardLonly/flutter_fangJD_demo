import 'dart:ffi';

import 'package:fangjd/Models/CategoryModel.dart';
import 'package:fangjd/Services/DioRequest.dart';
import 'package:fangjd/Services/ScreenAdapter.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'dart:convert';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with AutomaticKeepAliveClientMixin {

  int _selectIndex = 0;
  final double _leftWidth = Screenadapter.screenWidth() / 4;
  final dioRequest = Diorequest();
  List<CategoryItemModel> _leftCategoryItemList = [];
  List<CategoryItemModel> _rightCategoryItemList = [];

   // 保持页面状态的设置
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // 左边分类的数据请求
    _getLeftCategoryDataRequest();
  }

  // 左边分类的数据请求
  void _getLeftCategoryDataRequest() async {
    final response = await dioRequest.dio.get('http://jd.itying.com/api/pcate');
    if (response.statusCode == 200) {
      print(response.data is Map);
      final data = json.decode(response.data);
      final categoryM = CategoryModel.fromJson(data);
      setState(() {
        _leftCategoryItemList = categoryM.result;
      });
      // 默认请求第一条数据
      _rightCategoryDataRequest(_leftCategoryItemList[0].iId);
    } else {
      print('获取分类网络请求失败');
      setState(() {
        
      });
    }
  }

  // 右边分类的数据请求
  void _rightCategoryDataRequest(int pid) async {
    try {
      final response = await dioRequest.dio.get('http://jd.itying.com/api/pcate/pid=${pid}');
      final data = json.decode(response.data);
      final categoryM = CategoryModel.fromJson(data);
      setState(() {
        _rightCategoryItemList = categoryM.result;
      });
    } on DioException catch (_) {
      setState(() {
        _rightCategoryItemList = [];
      });
    }
  }


  // 左边的分类视图
  Widget _leftCategoryWidget() {
    return SizedBox(
      width: _leftWidth,
      height: double.infinity,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                _selectIndex = index;
              });
              _rightCategoryDataRequest(_leftCategoryItemList[index].iId);
            },
            child: Column(
              children: [
                Container(
                  color: _selectIndex == index ?  Color.fromRGBO(240, 240, 240, 0.9) : Colors.white,
                  height: Screenadapter.height(96),
                  child: Center(child: Text(_leftCategoryItemList[index].title, textAlign: TextAlign.center)),
                ),
                Container(
                  height: 1,
                  color: Colors.grey[200],
                )
              ],
            ),
          );
        },
        itemCount: _leftCategoryItemList.length,
      ),
    );
  }

  // 右边分类的子标题
  Widget _rightCategoryDetailWidget() {

    if (_rightCategoryItemList.isNotEmpty) {
      final double rightItemWidth = (Screenadapter.screenWidth() - _leftWidth -  Screenadapter.width(20) * 4) / 3;
      final double rightItemHeight = rightItemWidth + Screenadapter.height(50);
      final double childAspectRatio = rightItemWidth / rightItemHeight;

      return Expanded(
        child: Container(
          color: Color.fromRGBO(240, 240, 240, 0.9),
          child: GridView.builder(
            padding: EdgeInsets.all(Screenadapter.width(20)),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: Screenadapter.width(20),
              mainAxisSpacing: Screenadapter.width(20), 
              childAspectRatio: childAspectRatio
            ), 
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/productList');
                },
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1/1,
                      child: Image.network(_rightCategoryItemList[index].pic, fit: BoxFit.cover),
                    ),
                    SizedBox(height: Screenadapter.height(10)),
                    Container(
                      height: Screenadapter.height(40),
                      child: Center(child: Text(_rightCategoryItemList[index].title, textAlign: TextAlign.center)),
                    )
                  ],
                ),
              );
            },
            itemCount: _rightCategoryItemList.length,
          ),
        )
      );
    } else {
      return Expanded(
        child: Container(
          color: Color.fromRGBO(240, 240, 240, 0.9),
          child: Center(child: Text('暂无数据'))
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _leftCategoryWidget(),
          _rightCategoryDetailWidget()
        ],
      ),
    );
  }
}