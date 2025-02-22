import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        label: Text("点击跳转搜索页面"),
        onPressed: () {
          Navigator.pushNamed(context, '/search');
        },
      ),
    );
  }
}