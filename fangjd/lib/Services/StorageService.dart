import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static final _searchKey = "SearchHistory";

  // 获取搜索的历史记录
  static Future<List<String>> getSearchHistoryString() async {
    final shareInstance = await  SharedPreferences.getInstance();
    try {
      final historyString = shareInstance.getString(_searchKey);
      print("搜索历史记录 = $historyString");
      if (historyString != null) {
        List historyList = json.decode(historyString);
        return historyList.map((value){
          return "$value";
        }).toList();
      } else {
        print("搜索历史记录 没有数据");
      return [];
      }
    } catch (e) {
      print("搜索历史记录 没有数据");
      return [];
    }
  }

  /* 
  存储搜索历史记录
    如果有数据，就追加数据，然后存储；
    如果没有数据，就新建List，添加数据，然后存储；
  */
  static Future<void> setSearchHistoryString(String keyword) async {
    final shareInstance = await SharedPreferences.getInstance();
    try {
      final historyString = shareInstance.getString(_searchKey);
      if (historyString != null) {
        List historyList = json.decode(historyString);
        historyList.add(keyword);

        final dataString = json.encode(historyList);
        print("历史记录 = $dataString");
        shareInstance.setString(_searchKey, dataString);
      } else {
        List historyList = [keyword];
        final dataString = json.encode(historyList);
        print("历史记录 = $dataString");
        shareInstance.setString(_searchKey, dataString);
      }
    } catch (e) {
      List historyList = [keyword];
      final dataString = json.encode(historyList);
      print("历史记录 = $dataString");
      shareInstance.setString(_searchKey, dataString);
    }
  }

  // 删除某条历史记录
  static Future<List<String>> removeSearchKeyword(String keyword) async {
    final shareInstance = await SharedPreferences.getInstance();
    try {
      final historyString = shareInstance.getString(_searchKey);
      if (historyString != null) {
        List historyList = json.decode(historyString);
        List<String> historyStringList = historyList.map((value){
          return "$value";
        }).toList();
        historyStringList.remove(keyword);

        final dataString = json.encode(historyStringList);
        print("历史记录 = $dataString");
        shareInstance.setString(_searchKey, dataString);

        return historyStringList;
      } else {
      return [];
      }
    } catch (e) {
      return [];
    }
  }

  // 清空搜索历史记录
  static Future<void> clearSearchHistory() async {
    final shareInstance = await SharedPreferences.getInstance();
    try {
      shareInstance.remove(_searchKey);
    } catch (e) {
      print(e);
    }
  }
}