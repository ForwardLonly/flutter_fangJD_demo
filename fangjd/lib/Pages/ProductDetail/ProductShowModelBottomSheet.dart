import 'package:fangjd/CommonWidget/BackgroudButtonWidget.dart';
import 'package:fangjd/Services/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ProductShowModelBottomSheet {

  final List<String> _colorsList = ["红色", "黄色", "淡绿色", "浅灰色", "白色"];
  final List<String> _sizeList = ["SL", "ML", "LL", "XLL"];

  String _selectColorValue = "红色";
  String _selectSizeValue = "LL";

  // 中间视图
  Widget _contentListWidget(StateSetter state) {
    return ListView(
      children: [
        Wrap(
          children: [
            Container(
              width: Screenadapter.width(160),
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text("颜色:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              width: Screenadapter.screenWidth() - Screenadapter.width(200),
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: _colorsList.map((value){
                  return  InkWell(
                    onTap: (){
                      state((){
                        _selectColorValue = value;
                      });
                    },
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _selectColorValue == value ? Colors.red : Colors.grey[350]
                      ),
                      child:  Text(value, style: TextStyle(color: _selectColorValue == value ? Colors.white : Colors.black87)),
                    ),
                  );
                }).toList()
              ),
            )
          ],
        ),
        Wrap(
          children: [
            Container(
              width: Screenadapter.width(160),
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text("尺寸:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              width: Screenadapter.screenWidth() - Screenadapter.width(200),
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: _sizeList.map((value){
                  return  InkWell(
                    onTap: (){
                      state((){
                        _selectSizeValue = value;
                      });
                    },
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _selectSizeValue == value ? Colors.red : Colors.grey[350]
                      ),
                      child:  Text(value, style: TextStyle(color: _selectSizeValue == value ? Colors.white : Colors.black87)),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        )
      ],
    );
  }

  // 底部购买视图
   Widget _bottomWidget(StateSetter state) {
      return Container(
        height: 80,
        width: Screenadapter.width(750),
        child: Row(
          children: [
            Expanded(child: Container(
              margin: EdgeInsets.only(left: 20),
              child: BackgroudButtonWidget(
                backgroudColor: Colors.red,
                text: "加入购物车",
                callBack: (){
                  print("点击了加入购物车");
                },
              ), 
            )),
            // SizedBox(width: 20),
            Expanded(child: Container(
              margin: EdgeInsets.only(right: 20),
              child: BackgroudButtonWidget(
                backgroudColor: Colors.orange,
                text: "立即购买",
                callBack: (){
                  print("点击了立即购买");
                },
              ), 
            ))
          ],
        ),
      );
    }

    showDetailSelectInfoSheet(BuildContext context) {
      showModalBottomSheet(
        context: context, 
        builder: (context) {
          return StatefulBuilder(builder: (context, state){
            return  Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: Colors.black12
                  )
                )
              ),
              height: Screenadapter.height(800),
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: Stack(
                  children: [
                    _contentListWidget(state),
                    Positioned(
                      bottom: 0.0,
                      child: _bottomWidget(state)
                    )
                  ],
                ),
              ),
            );
          });
        }
      );
   }
}