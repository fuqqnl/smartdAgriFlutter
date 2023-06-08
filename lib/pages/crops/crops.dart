
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_agriculture/pages/crops/controller_item.dart';
import 'package:new_agriculture/pages/crops/header.dart';
import 'package:new_agriculture/pages/crops/image_preview.dart';

// 天气背景相关插件
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_cloud_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_color_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_night_star_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_rain_snow_bg.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_thunder_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/image_utils.dart';
import 'package:flutter_weather_bg_null_safety/utils/print_utils.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';

class ControllerInterface {
  final String icon;
  final String title;
  final String subtitle;
  final String type;
  ControllerInterface(this.icon, this.title, this.subtitle, this.type);
}


class Crops extends StatefulWidget {
  const Crops({Key? key}) : super(key: key);

  @override
  State<Crops> createState() => _CropsState();
}

class _CropsState extends State<Crops> {
  final ScrollController _scrollController = ScrollController();
  double _opacity = 1.0;
  bool _shouldHeaderHide = false;
  // late List<ControllerInterface> controllerList;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
    // 获取后台控制区域的数据

  }

  void _handleScroll() {
    setState(() {
      // 根据滚动位置更新透明度
      _opacity = 1.0 - (_scrollController.offset / 300).clamp(0.0, 1.0);
      if(_scrollController.offset > 300) {
        _shouldHeaderHide = true;
      } else {
        _shouldHeaderHide = false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    List<ControllerInterface> controllerList = [
      ControllerInterface(
        'https://chat.openai.com/apple-touch-icon.png',
        '天气',
        '预测两小时内降水情况',
        'weather',
      ),
      ControllerInterface(
        'https://chat.openai.com/apple-touch-icon.png',
        '讨论',
        '探讨经验，偶尔吹水',
        'community',
      ),
      ControllerInterface(
        'https://chat.openai.com/apple-touch-icon.png',
        '咨询专家',
        '找到适合的专家，解决生产难题',
        'expert',
      ),
      ControllerInterface(
        'https://chat.openai.com/apple-touch-icon.png',
        '天气',
        '预测两小时内降水情况',
        'weather',
      ),
      ControllerInterface(
        'https://chat.openai.com/apple-touch-icon.png',
        '讨论',
        '探讨经验，偶尔吹水',
        'talk',
      ),
      ControllerInterface(
        'https://chat.openai.com/apple-touch-icon.png',
        '咨询专家',
        '找到适合的专家，解决生产难题',
        'expert',
      ),

    ];
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff000000),
      ),
      // 分为3块，header、crops的长势和天气状态、控制区域
      child: Stack(
        children: [
          // 通过改变weatcherType，动态改变
          WeatherBg(weatherType: WeatherType.thunder ,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,),
          Offstage(
            offstage: _shouldHeaderHide,
            child: Header(),
          ),
          Opacity(
            opacity: _opacity,
            child: Container(
              margin: EdgeInsets.only(top: 130),
              child: Stack(
                children: [
                  ImagePreview(),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child:Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0x66000000),
                      ),
                      child: Text(
                        '提示目前的阶段，需要注意什么，需要补什么，点击查看详情>>',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    )
                  ),

                ],
              ),
            )
          ),
          ListView.builder(
            controller: _scrollController,
            itemCount: controllerList.length,
            padding: EdgeInsets.only(top: 450),
            itemBuilder: (BuildContext ctx, int index) {
              final item = controllerList[index] as ControllerInterface;
              print(item);
              return ControllerItem(item: item);
            }
          )

        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();

  }
}
