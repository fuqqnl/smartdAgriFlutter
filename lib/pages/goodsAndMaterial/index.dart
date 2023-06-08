/*
* @file 生产资料物资页面，这里面就需要详细的商品、搜素、加入购物车、直接购买的功能，是一个非常重要的功能块
 */

import 'package:flutter/material.dart';

class GoodsAndMaterialPage extends StatefulWidget {
  const GoodsAndMaterialPage({Key? key}) : super(key: key);

  @override
  State<GoodsAndMaterialPage> createState() => _GoodsAndMaterialPage();
}

class _GoodsAndMaterialPage extends State<GoodsAndMaterialPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Material Page!!'),
    );
  }
}

