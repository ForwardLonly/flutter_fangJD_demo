import 'package:fangjd/CommonWidget/SearchUnInputWiget.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Searchuninputwiget(),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.center_focus_weak)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.message))
        ],
      ),
      body: Center(
        child: Text("我是购物车"),
      ),
    );
  }
}