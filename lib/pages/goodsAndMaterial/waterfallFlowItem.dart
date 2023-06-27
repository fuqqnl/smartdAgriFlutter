/*
 * 具体的瀑布流具体每一项
 * */
import 'package:flutter/material.dart';

import 'index.dart';
class WaterfallItem extends StatefulWidget {
  final WaterFallData item;
  final Function(int) callbackFromParent;
  const WaterfallItem({Key? key, required this.item, required this.callbackFromParent}) : super(key: key);

  @override
  State<WaterfallItem> createState() => _WaterfallItemState();
}

class _WaterfallItemState extends State<WaterfallItem> {
  @override
  Widget build(BuildContext context) {
    WaterFallData item = widget.item;
    Function(int) callbackFromParent = widget.callbackFromParent;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () {
          // 点击执行

        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(item.imgUrl),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(item.desc, style: TextStyle(fontSize: 14, color: Colors.black),),
            )
          ],
        ),
      )
    );
  }
}
