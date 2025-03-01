import 'package:fangjd/Pages/ProductDetailPage.dart';
import 'package:fangjd/Pages/ProductList.dart';
import 'package:flutter/material.dart';
import 'package:fangjd/Pages/Tabs.dart';
import 'package:fangjd/Pages/Search.dart';


//配置路由
final routes = {
  '/': (context) => Tabs(),
  '/search' : (context) => SearchPage(),
  // 设置带参数的路由
  '/productList': (context, {arguments}) => ProductlistPage(arguments: arguments),
  '/productDetail': (context) => ProductDetailPage(),
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
// 统一处理
  final String name = settings.name ?? "";
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};