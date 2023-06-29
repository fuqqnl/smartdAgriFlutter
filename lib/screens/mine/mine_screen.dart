/**
 * @file 我的页面
 */
import 'package:flutter/material.dart';

class MineScreen extends StatefulWidget {
  const MineScreen({Key? key}) : super(key: key);

  @override
  State<MineScreen> createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('我的页面'),
    );
  }
}
