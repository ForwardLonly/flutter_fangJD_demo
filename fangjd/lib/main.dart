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
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              // backgroundColor: Colors.white 
            )
          ),
        );
      },
    );
  }
}