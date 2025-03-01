import 'dart:ffi';

import 'package:flutter/material.dart';

class ShowAlertWidget {
   /// 显示一个带有标题和内容的对话框
  /// 
  /// 参数：
  /// - `context`: 当前上下文
  /// - `title`: 对话框标题
  /// - `content`: 对话框内容
  /// 
  /// 返回值：
  /// - 0: 用户点击了 "取消"
  /// - 1: 用户点击了 "确定"
  static Future<int> showAlert(BuildContext context, String title, String content) async {
      final value = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 0); // 返回值为 0，表示取消
                },
                child: Text("取消"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 1); // 返回值为 1，表示确定
                },
                child: Text("确定"),
              ),
            ],
          );
        },
      ) ?? 0; // 如果用户直接关闭对话框，则默认返回 0（取消）
    print("value = $value");
    return value;
  }
}