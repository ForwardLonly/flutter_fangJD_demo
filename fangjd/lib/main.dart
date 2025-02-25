import 'package:flutter/material.dart';
import 'package:fangjd/Routers/Router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 网络请求
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    // final dio = Dio();
    // // TODO: --设置代理的地方，等待删除
    //  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) { 
    //       client.findProxy = (uri) {
    //         return 'PROXY 192.168.1.4:8888';
    //       };
    //  };
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
        // home: Tabs()
          initialRoute: '/',
          onGenerateRoute: onGenerateRoute,
        );
      },
    );
  }
}