import 'package:fangjd/Services/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class Loadingwidget extends StatelessWidget {
  const Loadingwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(Screenadapter.width(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(strokeWidth: 1.0),
            SizedBox(width: Screenadapter.width(20)),
            Text("加载中....")
          ],
        ),
      ),
    );
  }
}