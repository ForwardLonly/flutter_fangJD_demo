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
  // 添加一个controller
  late PageController _pageController;
  final List<Widget> _pageList = [
    HomePage(),
    CategoryPage(),
    ShopPage(),
    MyPage()
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("JD_demo"),
        // ),
        // body 中，必须用pageView来包裹
        body: PageView(
          // 第一个需要设置的属性：controller， 用于控制加载页面
          controller: _pageController,
          // 第二个需要设置的属性：需要加载哪些页面
          children: _pageList,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
              _pageController.jumpToPage(_currentIndex);
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