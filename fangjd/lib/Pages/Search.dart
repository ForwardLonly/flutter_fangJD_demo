import 'package:fangjd/Services/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

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
        ),
    );
  }

  // 设置搜索的按钮
  Widget _searchItemWiget() {
    return InkWell(
      onTap: (){},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _searchInputWidget(),
        actions: [
          _searchItemWiget()
        ],
      ),
      body: Center(
        child: Text("我是搜索页"),
      ),
    );
  }
}