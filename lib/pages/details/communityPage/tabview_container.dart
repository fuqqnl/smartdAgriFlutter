import 'package:flutter/material.dart';
import '../../../constant/constant.dart';

class TabViewContainer extends StatefulWidget {
  final String tabName;
  const TabViewContainer({Key? key, required this.tabName}) : super(key: key);

  @override
  State<TabViewContainer> createState() => _TabViewContainerState();
}

class _TabViewContainerState extends State<TabViewContainer> {
  @override
  void initState() {
    super.initState();
    print("TabViewContainer--initState");
  }

  @override
  Widget build(BuildContext context) {
    print("TabViewContainer--build");
    // if(widget.tabName == '动态'){
    //
    // } else if  (widget.tabName == '圈子') {
    //
    // }
    // TODO: 通过区分tabName,进行不同内容的获取，通过接口区分和获取
    // TODO: 如果刚开始没有内容，则需要一个默认的加载中状态

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        // TODO: 把真正的list数据传进去
        return getCommonItemList([], index);
      }, childCount: 10),
    );
  }

  getCommonItemList(list, index) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('${Constant.ASSETS_IMG}home.png'),
            ),
            title: Text(
              'The Enchanted Nightingale',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF555555)),
            ),
            subtitle: Text(
              'Music by Julie Gable. Lyrics by Sidney Stein.',
              style: TextStyle(fontSize: 13),
            ),
          ),
          const ListTile(
            title: Text(
              '这里是卡片内容部分这里是卡片内容部分这里是卡片内容部分这里是卡片内容部分这里是卡片内容部分\n这里是卡片内容部分这里是卡片内容部分\n内容\n内容部分后面该有省略号了内容部分后面该有省略号了内容部分后面该有省略号了',
              textAlign: TextAlign.left,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF555555),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 12,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.pages),
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '1',
                          style: TextStyle(fontSize: 12),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.account_circle_rounded),
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '88',
                          style: TextStyle(fontSize: 12),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.share),
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '5',
                          style: TextStyle(fontSize: 12),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
