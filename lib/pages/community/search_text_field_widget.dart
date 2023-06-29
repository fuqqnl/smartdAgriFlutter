/*
* @file 文本搜素框
 */
import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTab;
  final String? hintText;
  final EdgeInsetsGeometry? margin;

  const SearchTextFieldWidget({Key? key, this.hintText, this.onSubmitted, this.onTab, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin == null ? EdgeInsets.all(0.0) : margin,
      width: MediaQuery.of(context).size.width,
      alignment: AlignmentDirectional.center,
      height: 35.0,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 237, 236, 237),
          borderRadius: BorderRadius.circular(24.0)),
      child: TextField(
        enabled: true,
        onSubmitted: onSubmitted,
        onTap: onTab,
        cursorColor: Color.fromARGB(255, 0, 189, 96),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 0),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 192, 191, 191)),
            prefixIcon: Icon(
              Icons.search,
              size: 25,
              color: Color.fromARGB(255, 128, 128, 128),
            )),
        style: TextStyle(fontSize: 16),
      ),
    );
  }

}