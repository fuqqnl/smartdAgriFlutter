import 'package:flutter/material.dart';
import 'package:new_agriculture/screens/home/home_screen.dart';
import 'package:new_agriculture/screens/mine/mine_screen.dart';

import 'package:new_agriculture/screens/goodsAndMaterial/goods_screen.dart';
import 'package:new_agriculture/screens/shoppingCart/cart_screen.dart';

// 真正内容
class ContainerPage extends StatefulWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  int currentIndex = 0;
  late List<Widget> pages;
  @override
  void initState() {
    super.initState();
    // 有四个一级tab，分别是首页、物资、购物车、我的
    pages = [
      // 首页
      const HomeScreen(),
      // 物资
      const GoodsAndMaterialScreen(),
      // 购物车
      const ShoppingCartScreen(),
      // 我的
      const MineScreen()
    ];
  }

  // 选择哪个page展示
  Widget _getPagesWidget(int index) {
    return Offstage(
      offstage: currentIndex != index,
      child: TickerMode(
        enabled: currentIndex == index,
        child: pages[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _getPagesWidget(0),
          _getPagesWidget(1),
          _getPagesWidget(2),
          _getPagesWidget(3),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildBottomItem(currentIndex, 0, Icons.home, "首页"),
            buildBottomItem(currentIndex, 1, Icons.person, "物资"),
            buildBottomItem(currentIndex, 2, Icons.person, "购物车"),
            buildBottomItem(currentIndex, 3, Icons.person, "我的"),
          ], //均分底部导航栏横向空间
        ),
      ),
    );
  }

  /// @param selectIndex 当前选中的页面
  /// @param index 每个条目对应的角标
  /// @param iconData 每个条目对就的图标
  /// @param title 每个条目对应的标题
  buildBottomItem(int selectIndex, int index, IconData iconData, String title) {
    //未选中状态的样式
    TextStyle textStyle = const TextStyle(fontSize: 12.0, color: Colors.grey);
    MaterialColor iconColor = Colors.grey;
    double iconSize = 20.0;
    EdgeInsets padding = const EdgeInsets.only(top: 8.0);

    if (selectIndex == index) {
      //选中状态的文字样式
      textStyle = const TextStyle(fontSize: 13.0, color: Colors.blue);
      //选中状态的按钮样式
      iconColor = Colors.blue;
      iconSize = 25;
      padding = const EdgeInsets.only(top: 6.0);
    }
    Widget padItem = Padding(
      padding: padding,
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: <Widget>[
              Icon(
                iconData,
                color: iconColor,
                size: iconSize,
              ),
              Text(
                title,
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
    Widget item = Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          if (index != currentIndex) {
            setState(() {
              currentIndex = index;
            });
          }
        },
        child: SizedBox(
          height: 52,
          child: padItem,
        ),
      ),
    );
    return item;
  }
}
