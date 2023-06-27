import 'dart:async';
import 'package:flutter/material.dart';

class CountDownWidget extends StatefulWidget {
  const CountDownWidget({Key? key, required this.countDownCallback})
      : super(key: key);

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
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
