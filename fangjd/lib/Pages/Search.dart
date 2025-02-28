import 'package:fangjd/Services/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final List<String> _hotSearchData = ["超级秒杀", "办公电脑", "儿童汽车", "唇彩唇蜜", "哪吒2"];
  final List<String> _historySearchData = ["贝亲奶瓶", "纸尿裤", "婴儿衣架", "包被"];

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

  // 热搜的视图
  Widget _hotSearchWidget() {
    return SizedBox(
        height: Screenadapter.height(180),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                Text("热搜", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800))
              ],
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _hotSearchData.map((value){
                  return Container(
                    height: 30,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    margin: EdgeInsets.only(right: 10),
                    color: Colors.grey[200],
                    child: Center(child: Text(value)),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 15,
              color: Colors.grey[200],
            )
          ],
        ),
    );
  }

  // 历史搜索
  Widget _historSearchTitleWidget() {
    return SizedBox(
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child:  Container(
              padding: EdgeInsets.only(top: 14, bottom: 14, left: 10),
              child: Text("历史搜索", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800), textAlign: TextAlign.start),
            )),
          Divider(height: 1, color: Colors.grey[200])
        ],
      ),
    );
  }

  // 搜索页面的内容视图
  Widget _searchHotAndHistroyWidget() {
    return ListView.builder(
      itemBuilder: (context, index){
        if (index == 0) {
          return _hotSearchWidget();
        }
        if (index == 1) {
          return _historSearchTitleWidget();
        }
        return Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 14, bottom: 14),
                child: Text(_historySearchData[index -2], style: TextStyle(fontSize: 16), textAlign: TextAlign.start),
              ),
              Divider(height: 1, color: Colors.grey[200])
            ],
          ),
        );
      },
      itemCount: _historySearchData.length + 2,
    );
  }

  // 删除的按钮
  Widget _deleteHistoryWiget() {
    return Container(
      margin: EdgeInsets.only(left: Screenadapter.width(60), right: Screenadapter.width(60)),
      height: Screenadapter.height(100),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black45
        ),
        borderRadius: BorderRadius.circular(5)
      ),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.delete),
            Text("清空所有历史记录")
          ],
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
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            Expanded(child: _searchHotAndHistroyWidget()),
            _deleteHistoryWiget()
          ],
        ),
      ),
    );
  }
}