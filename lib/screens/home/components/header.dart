import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  double _iconOpacity = 1.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(top: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: Text(
                  '勇敢牛牛',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: Text('vip1',
                    style: TextStyle(fontSize: 14, color: Colors.blueGrey)),
              )
            ],
          ),
          Wrap(
            children: [
              GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _iconOpacity = 0.5;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _iconOpacity = 1.0;
                    // TODO 跳转页面
                  });
                },
                child: Opacity(
                  opacity: _iconOpacity,
                  child: const Icon(
                    Icons.add_shopping_cart,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _iconOpacity = 0.5;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _iconOpacity = 1.0;
                    // TODO 跳转到我的页面
                  });
                },
                child: ClipOval(
                  child: Image.network(
                    'https://duerstatic.cdn.bcebos.com/smartMirror/image_dome_small_02.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
