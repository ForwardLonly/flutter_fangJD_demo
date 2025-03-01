import 'package:flutter/material.dart';

class BackgroudButtonWidget extends StatelessWidget {

  final Color backgroudColor;
  final String text;
  final VoidCallback? callBack;


  const BackgroudButtonWidget({super.key, this.backgroudColor = Colors.white, this.text = "按钮", this.callBack});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callBack,
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroudColor
        ),
        child: Text(text, textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
      ),
    );
  }
}