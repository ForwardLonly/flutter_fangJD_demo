import 'package:flutter/material.dart';
import 'package:flutter_swiper_3/flutter_swiper_3.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _swiperWidget() {
    final List<Map> _imageList = [
      {
        "url":
            "https://pic.rmb.bdstatic.com/bjh/news/0fc6b71c59a69f39cf2e1244d10eaedc.jpeg"
      },
      {
        "url":
            "https://i-blog.csdnimg.cn/blog_migrate/41635df939e6dd13c6d5e2af785d358b.jpeg"
      },
      {
        "url":
            "https://img1.baidu.com/it/u=1368815763,3761060632&fm=253&fmt=auto&app=138&f=JPEG?w=760&h=434"
      },
    ];
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            _imageList[index]["url"],
            fit: BoxFit.fill,
          );
        },
        itemCount: _imageList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [_swiperWidget()],
    );
  }
}
