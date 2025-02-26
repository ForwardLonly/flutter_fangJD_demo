import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class Diorequest {
  final dio = Dio();
  
  Diorequest() {
    // TODO: --zhuzhu 这个地方待删除
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) { 
          client.findProxy = (uri) {
            return 'PROXY 192.168.1.4:8888';
          };
     };
  }
}