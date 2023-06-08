/*
* @file 生产资料物资页面，这里面就需要详细的商品、搜素、加入购物车、直接购买的功能，是一个非常重要的功能块
 */

import 'package:flutter/material.dart';

import 'search_mask_page.dart';

class GoodsAndMaterialPage extends StatefulWidget {
  const GoodsAndMaterialPage({Key? key}) : super(key: key);

  @override
  State<GoodsAndMaterialPage> createState() => _GoodsAndMaterialPage();
}

class _GoodsAndMaterialPage extends State<GoodsAndMaterialPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.zoom_out_map),
              onPressed: () {
                // 处理按钮点击事件
              },
            ),
          ],

          title: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push
                    (
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context){
                          return SearchMaskPage();
                        }
                    ),
                  );
                },
                child: Container(
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.only(left: 16,right: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('最新产品', style: TextStyle(fontSize: 16, color: Colors.black),),
                        GestureDetector(
                          onTap: () {
                            print('点击搜索按钮了');
                          },
                          child: Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(102, 202, 222, 1),
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                              child: Align(
                                child: Text('搜索', style: TextStyle(fontSize: 14, color: Colors.black),),
                              )
                          ),
                        )
                      ],
                    )
                ),
              )
          )
      ),
    );

  }
}

