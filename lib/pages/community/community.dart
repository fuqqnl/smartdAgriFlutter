/**
 * @file 社区页面，讨论相关
 * */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './search_text_field_widget.dart';
import 'PrimaryScrollContainerState.dart';
import 'tabview_container.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin {
  final _tabs = ['动态', '圈子'];
  late TabController _tabController;
  late List<GlobalKey<PrimaryScrollContainerState>> scrollChildKeys =
      List.generate(2, (index) => GlobalKey());

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      for (int i = 0; i < scrollChildKeys.length; i++) {
        GlobalKey<PrimaryScrollContainerState> key = scrollChildKeys[i];
        if (key.currentState != null) {
          key.currentState!.onPageChange(_tabController.index == i);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("_CommunityPageState--build");
    }
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                floating: false, // 是否漂浮
                pinned: true, // 是否固定
                primary: true,
                forceElevated: innerBoxIsScrolled,
                expandedHeight: 200, // 展开时的高度
                backgroundColor: Colors.lightBlueAccent,
                flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Image.network(
                      'https://chat.openai.com/apple-touch-icon.png',
                      fit: BoxFit.cover,
                    )),
                title: Row(
                  children: [
                    Expanded(
                      child: SearchTextFieldWidget(
                        hintText: '新的搜索框',
                        margin: EdgeInsets.only(left: 0),
                        onTab: () {
                          // 处理新搜索框的点击事件
                        },
                      ),
                    ),
                  ],
                ),
                titleSpacing: 10,
                leadingWidth: 40,
                bottom: TabBar(
                    controller: _tabController,
                    labelStyle: const TextStyle(fontSize: 16),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.blueGrey,
                    tabs: _tabs.map((item) => Tab(text: item)).toList()),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: _tabs.map((name) {
            int idx = _tabs.indexOf(name);
            print('每个tabBarView初始创建: $name');
            return PrimaryScrollContainer(
                scrollChildKeys[idx], //GlobalKey
                SliverContainer(name: name));
          }).toList(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}

class SliverContainer extends StatefulWidget {
  final String name;
  const SliverContainer({Key? key, required this.name}) : super(key: key);

  @override
  State<SliverContainer> createState() => _SliverContainerState();
}

class _SliverContainerState extends State<SliverContainer>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print('当前view创建的名字是${widget.name}');
    super.build(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          TabViewContainer(tabName: widget.name)
          // sliverListNew
        ],
      ),
    );
  }

  @override
  // implement wantKeepAlive
  bool get wantKeepAlive => true;
}
