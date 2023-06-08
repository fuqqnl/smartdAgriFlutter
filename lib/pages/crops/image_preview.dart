import 'package:flutter/material.dart';
import '../../constant/constant.dart';

class ImagePreview extends StatefulWidget {
  const ImagePreview({Key? key}) : super(key: key);

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    // TODO 需要实现图片与天气动态效果的集合效果
    return Container(
      height: 300,

      child: Align(
        alignment: Alignment.center,
        child: Image.network(
          'https://duerstatic.cdn.bcebos.com/smartMirror/jiangmiao.png',
          fit: BoxFit.contain,

        ),
      )


    );
  }
}
