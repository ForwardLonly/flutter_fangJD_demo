import 'package:fangjd/Services/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class ProductlistPage extends StatefulWidget {
  const ProductlistPage({super.key});

  @override
  State<ProductlistPage> createState() => _ProductlistPageState();
}

class _ProductlistPageState extends State<ProductlistPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品分类"),
      ),
      body: Padding(
        padding: EdgeInsets.all(Screenadapter.width(10)),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(Screenadapter.width(20)),
                      width: Screenadapter.width(220),
                      height: Screenadapter.height(220),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network('https://www.itying.com/images/flutter/hot5.jpg', fit: BoxFit.cover)
                      ),
                    ),
                    Expanded(child: Container(
                      height: Screenadapter.height(220),
                      padding: EdgeInsets.only(top: Screenadapter.height(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "艾伦伯顿（Alen Botun）跑步运动套装男宽松晨跑速干衣体育田径骑行训练马拉松健身房冬季 五件套-四季搭配 XL",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: Screenadapter.height(20)),
                          Container(
                            height: Screenadapter.height(36),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(
                                  height: Screenadapter.height(40),
                                  width: Screenadapter.width(80),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Screenadapter.height(18)),
                                    color: Colors.black12
                                  ),
                                  child: Center(child: Text(' 4G ', style: TextStyle(color: Colors.black87))),
                                ),
                                SizedBox(width: Screenadapter.width(20)),
                                Container(
                                  height: Screenadapter.height(40),
                                  width: Screenadapter.width(80),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Screenadapter.height(18)),
                                    color: Colors.black12
                                  ),
                                  child: Center(child: Text(' 126 ', style: TextStyle(color: Colors.black87))),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: Screenadapter.width(20)),
                          Text("￥189", style: TextStyle(color: Colors.red, fontSize: 18),)
                        ]
                      )
                    ))
                  ],
                ),
                Divider(height: Screenadapter.height(2))
              ],
            );
          },
          itemCount: 10
        ),
      ),
    );
  }
}