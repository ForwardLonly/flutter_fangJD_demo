import 'package:flutter/material.dart';
import 'package:fangjd/Pages/Home.dart';
import 'package:fangjd/Pages/Category.dart';
import 'package:fangjd/Pages/Shop.dart';
import 'package:fangjd/Pages/My.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  final List _pageList = [
    HomePage(),
    CategoryPage(),
    ShopPage(),
    MyPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("JD_demo"),
        ),
        body: _pageList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          // 如果items的数量超过三个的话，就需要设置这个属性，否者显示不出来
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(icon: Icon( Icons.home), label: "首页"),
            BottomNavigationBarItem(icon: Icon( Icons.category), label: "分类"),
            BottomNavigationBarItem(icon: Icon( Icons.shopping_cart), label: "购物车"),
            BottomNavigationBarItem(icon: Icon( Icons.people), label: "我的")
          ]),
     );
  }
}