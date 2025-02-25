import 'package:fangjd/Services/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  int _selectIndex = 0;

  // 左边的分类视图
  Widget _leftCategoryWidget() {
    return SizedBox(
      width: Screenadapter.width(180),
      height: double.infinity,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                _selectIndex = index;
              });
            },
            child: Column(
              children: [
                Container(
                  color: _selectIndex == index ?  Color.fromRGBO(240, 240, 240, 0.9) : Colors.white,
                  height: Screenadapter.height(96),
                  child: Center(child: Text('分类标题', textAlign: TextAlign.center)),
                ),
                Container(
                  height: 1,
                  color: Colors.grey[200],
                )
              ],
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  // 右边分类的子标题
  Widget _rightCategoryDetailWidget() {
    return Expanded(
      child: Container(
        color: Color.fromRGBO(240, 240, 240, 0.9),
        child: GridView.builder(
          padding: EdgeInsets.all(Screenadapter.width(20)),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: Screenadapter.width(20),
            mainAxisSpacing: Screenadapter.width(20), 
            childAspectRatio: 1/1.5
          ), 
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1/1,
                    child: Image.network('https://www.itying.com/images/flutter/hot${index+1}.jpg', fit: BoxFit.cover),
                  ),
                  SizedBox(height: Screenadapter.height(10)),
                  Container(
                    height: Screenadapter.height(40),
                    child: Center(child: Text('衣服', textAlign: TextAlign.center)),
                  )
                ],
              ),
            );
          },
          itemCount: 10,
        ),
      )
    );
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