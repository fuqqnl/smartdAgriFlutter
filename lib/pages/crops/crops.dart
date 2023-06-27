import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
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

class Crops extends StatefulWidget {
  const Crops({Key? key}) : super(key: key);

  @override
  State<Crops> createState() => _CropsState();
}

class _CropsState extends State<Crops> {
  final ScrollController _scrollController = ScrollController();
  double _opacity = 1.0;
  bool _shouldHeaderHide = false;
  List<Map<String, dynamic>> decodeData = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
    // 获取后台控制区域的数据
    // 假设返回的数据如下：
    String resultData =
        '[{"icon":"mars","title":"天气","subtitle":"预测两小时内降水情况", "type": "weather"},{"icon":"bahai","title":"讨论","subtitle":"探讨经验，偶尔吹水", "type": "community"},{"icon":"baby","title":"咨询专家","subtitle":"找到适合的专家，解决生产难题", "type":"query"}]';
    decodeData = jsonDecode(resultData).cast<Map<String, dynamic>>();
  }

  void _handleScroll() {
    setState(() {
      // 根据滚动位置更新透明度
      _opacity = 1.0 - (_scrollController.offset / 300).clamp(0.0, 1.0);
      if (_scrollController.offset > 300) {
        _shouldHeaderHide = true;
      } else {
        _shouldHeaderHide = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff000000),
      ),
      // 分为3块，header、crops的长势和天气状态、控制区域
      child: Stack(
        children: [
          // TODO:通过改变weatcherType，动态改变
          WeatherBg(
            weatherType: WeatherType.sunnyNight,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Offstage(
            offstage: _shouldHeaderHide,
            child: const Header(),
          ),
          Opacity(
            opacity: _opacity,
            child: Container(
              margin: const EdgeInsets.only(top: 130),
              child: Stack(
                children: [
                  const ImagePreview(),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color(0x66000000),
                      ),
                      child: const Text(
                        '提示目前的阶段，需要注意什么，需要补什么，点击查看详情>>',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListView.builder(
            controller: _scrollController,
            itemCount: decodeData.length,
            padding: const EdgeInsets.only(top: 450),
            itemBuilder: (BuildContext ctx, int index) {
              return ControllerItem(item: decodeData[index]);
            },
          ),
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
