import 'package:fangjd/Services/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class Searchuninputwiget extends StatelessWidget {
  const Searchuninputwiget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/search');
      },
      child: Container(
        height: Screenadapter.height(80),
        padding: EdgeInsets.only(left: Screenadapter.width(30)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Screenadapter.height(40)),
          color: Color.fromRGBO(233, 233, 233, 0.9)
        ),
        child: Row(
          children: [
            Icon(Icons.search, size: 18, color: Colors.black45),
            SizedBox(width: 5),
            Text("请输入你想搜索的商品", style: TextStyle(fontSize: 14, color: Colors.black45))
          ],
        ),
      ),
    );
  }
}