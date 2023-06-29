/*
* @file 生产资料物资页面，这里面就需要详细的商品、搜素、加入购物车、直接购买的功能，是一个非常重要的功能块
 */

import 'package:flutter/material.dart';
import 'package:waterfall_flow/waterfall_flow.dart';
import 'components/search_mask_page.dart';
import 'components/waterfallFlowItem.dart';

class WaterFallData {
  final String id;
  final String imgUrl;
  final String desc;
  const WaterFallData(this.id, this.imgUrl, this.desc);
}

class GoodsAndMaterialScreen extends StatefulWidget {
  const GoodsAndMaterialScreen({Key? key}) : super(key: key);

  @override
  State<GoodsAndMaterialScreen> createState() => _GoodsAndMaterialScreen();
}

class _GoodsAndMaterialScreen extends State<GoodsAndMaterialScreen> {
  bool _smallTopBarShow = false;
  double searchWidth = 300;
  double searchTop = 60;
  final ScrollController _scrollController = ScrollController();
  List<String> carouselImages = [
    // 轮播图图片链接
    'https://alifei04.cfp.cn/creative/vcg/800/new/VCG21gic13899040.jpg',
    'https://tenfei05.cfp.cn/creative/vcg/800/version23/VCG2154e83874f.jpg',
    'https://alifei05.cfp.cn/creative/vcg/800/version23/VCG21gic6370954.jpg',
  ];

  List<String> articleData = [
    // 正文数据
    'Article 1',
    'Article 2',
    'Article 3',
    'Article 1',
    'Article 2',
    'Article 3',
    'Article 1',
    'Article 2',
    'Article 3',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        searchWidth = MediaQuery.of(context).size.width;
      });
    });
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    setState(() {
      // 根据滚动位置更新搜索区域的宽度和位置
      if (_scrollController.offset > 40) {
        _smallTopBarShow = true;
        searchTop = 50;
        searchWidth = MediaQuery.of(context).size.width - 60;
      } else {
        _smallTopBarShow = false;
        searchTop = 60;
        searchWidth = MediaQuery.of(context).size.width;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // 模拟瀑布流数据
    List<WaterFallData> waterFallData = [];
    String mockUrl = 'https://chat.openai.com/apple-touch-icon.png';
    for (int i = 0; i < 10; i++) {
      if (i == 1 || i == 6) {
        mockUrl =
            'https://p1-jj.byteimg.com/tos-cn-i-t2oaga2asx/gold-user-assets/2019/6/28/16b9ebe61ee1bd11~tplv-t2oaga2asx-zoom-in-crop-mark:4536:0:0:0.image';
      } else {
        mockUrl = 'https://chat.openai.com/apple-touch-icon.png';
      }
      waterFallData.add(
          new WaterFallData('testid-$i', mockUrl, '这时简介部分，只是个最简单的例子，后面需要细化'));
    }
    print('Bulid 方法执行');
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(238, 236, 235, 1),
            ),
            child: Stack(
              children: [
                CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                          height: 500, // 上面部分高度
                          child: Stack(
                            children: [
                              // 背景图+搜索+扫码相关区域
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 400,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://alifei05.cfp.cn/creative/vcg/800/version23/VCG21gic6370954.jpg'),
                                      fit: BoxFit.cover),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                // 点击扫码操作
                                                print('扫码按钮被点击');
                                              },
                                              icon: Icon(
                                                Icons.image,
                                                size: 24,
                                                color: Colors.white,
                                              ))
                                        ],
                                      ),
                                    ),
                                    // 搜索框
                                    AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        margin: EdgeInsets.only(top: 60),
                                        height: 40,
                                        width: searchWidth - 30,
                                        alignment: Alignment.topCenter,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder:
                                                  (BuildContext context) {
                                                return SearchMaskPage();
                                              }),
                                            );
                                          },
                                          child: Container(
                                              height: 40,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              padding: EdgeInsets.only(
                                                  left: 16, right: 6),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '最新产品',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      print('点击搜索按钮了');
                                                    },
                                                    child: Container(
                                                        width: 60,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color.fromRGBO(
                                                                    211,
                                                                    223,
                                                                    241,
                                                                    1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15))),
                                                        child: Align(
                                                          child: Text(
                                                            '搜索',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        )),
                                                  )
                                                ],
                                              )),
                                        ))
                                  ],
                                ),
                              ),
                              // 轮播图位置
                              Container(
                                height: 200,
                                margin: EdgeInsets.only(top: 160),
                                child: PageView.builder(
                                  itemCount: carouselImages.length,
                                  itemBuilder: (context, index) {
                                    return Image.network(
                                      carouselImages[index],
                                      fit: BoxFit.contain,
                                    );
                                  },
                                ),
                              ),
                              // 类别放置区域
                              Container(
                                  width: MediaQuery.of(context).size.width - 20,
                                  height: 110,
                                  margin: EdgeInsets.only(left: 10, top: 370),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: GridView.count(
                                    crossAxisCount: 5,
                                    childAspectRatio: 1, // 设置宽高比例
                                    children: List.generate(5, (index) {
                                      return Container(
                                        width: 60,
                                        child: Column(children: [
                                          Image.network(
                                            'https://chat.openai.com/apple-touch-icon.png',
                                            width: 40,
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Text(
                                                '买药',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black),
                                              ))
                                        ]),
                                      );
                                    }),
                                  )),
                            ],
                          )),
                    ),
                    // 瀑布流实现

                    // SliverGrid(
                    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 2,
                    //     mainAxisSpacing: 10,
                    //     crossAxisSpacing: 10,
                    //     childAspectRatio: 0.7, // 调整子项的宽高比例
                    //   ),
                    //   delegate: SliverChildBuilderDelegate(
                    //         (BuildContext context, int index) {
                    //       return  WaterfallItem(item: waterFallData[index], callbackFromParent: (id) {
                    //         // 返回id后，就知道了打开新页面后，应该请求哪个数据
                    //       });
                    //     },
                    //     childCount: waterFallData.length,
                    //   ),
                    // ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      WaterfallFlow.builder(
                        scrollDirection: Axis.vertical,
                        // shrinkWrap -> 收缩包围
                        // 这句属性太重要了，在这里卡了1个多小时，这的意思是只包装里面的内容，那么高度就是内容的高度。 默认是false，也就是占用尽量多的空间，所以就报必须要设置高度的错误了。
                        // 不光这里，其他的能滚动的都能用，包括ListView/GridView等,当然也就包括ListView.build/GridView.build
                        shrinkWrap: true,
                        // 但是如果不加physics: ScrollPhysics(),就会出现瀑布流滑不动的情况，所以这句也一定要加，ListView/GridView等可滚动的Widget
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.all(10.0),
                        gridDelegate:
                            SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          lastChildLayoutTypeBuilder: (index) =>
                              index == waterFallData.length
                                  ? LastChildLayoutType.foot
                                  : LastChildLayoutType.none,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return WaterfallItem(
                              item: waterFallData[index],
                              callbackFromParent: (id) {});
                        },
                        itemCount: waterFallData.length,
                      )
                    ]))
                  ],
                ),
                // 顶部fixed的层
                Positioned(
                    top: 0,
                    left: 0,
                    child: Offstage(
                      offstage: !_smallTopBarShow,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    margin: EdgeInsets.only(top: 0),
                                    height: 40,
                                    width: searchWidth - 60,
                                    alignment: Alignment.topCenter,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                            return SearchMaskPage();
                                          }),
                                        );
                                      },
                                      child: Container(
                                          height: 40,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          padding: EdgeInsets.only(
                                              left: 16, right: 6),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '最新产品',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  print('点击搜索按钮了');
                                                },
                                                child: Container(
                                                    width: 60,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            211, 223, 241, 1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15))),
                                                    child: Align(
                                                      child: Text(
                                                        '搜索',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    )),
                                              )
                                            ],
                                          )),
                                    )),
                                IconButton(
                                    onPressed: () {
                                      // 点击扫码操作
                                      print('白色背景的topBar扫码按钮被点击');
                                    },
                                    icon: Icon(
                                      Icons.image,
                                      size: 24,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                          )),
                    ))
              ],
            )));
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }
}

class FixedOverlayDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double targetExtent;

  FixedOverlayDelegate({required this.child, required this.targetExtent});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => targetExtent;

  @override
  double get minExtent => targetExtent;

  @override
  bool shouldRebuild(FixedOverlayDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}
