import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_agriculture/constant/constant.dart';

/// 广告页面展示逻辑
class SplashAd extends StatefulWidget {
  const SplashAd({Key? key, required this.cb}) : super(key: key);

  final VoidCallback cb;

  @override
  State<SplashAd> createState() => _SplashAdState();
}

class _SplashAdState extends State<SplashAd> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.green,
                  backgroundImage: AssetImage('${Constant.ASSETS_IMG}home.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('青禾', style: TextStyle(fontSize: 15, color: Colors.black),),
                ),
              ],
            ),
          ),
          SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 倒计时
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 30, top: 20),
                      padding: const EdgeInsets.only(top: 2,bottom: 2, left: 6, right: 6),
                      decoration: const BoxDecoration(
                          color: Color(0xffEDEDED),
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      child: CountDownWidget(
                          countDownCallback: () {
                            // 倒计时结束时，向上传递状态
                            widget.cb();
                          }
                      ),
                    ),
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}

class CountDownWidget extends StatefulWidget {
  const CountDownWidget({Key? key, required this.countDownCallback}) : super(key: key);

  final VoidCallback countDownCallback;

  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  int _seconds = 6;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      '$_seconds',
      style: const TextStyle(fontSize: 17),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      if (_seconds <= 1) {
        // 向上传递状态
        widget.countDownCallback();
        _cancelTimer();
        return;
      }
      _seconds--;
    });
  }

  void _cancelTimer() {
    _timer.cancel();
  }
}