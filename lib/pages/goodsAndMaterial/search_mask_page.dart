/*
* @file 搜索页面，真正进行搜索的地方
 */

import 'package:flutter/material.dart';

class SearchMaskPage extends StatefulWidget {
  const SearchMaskPage({Key? key}) : super(key: key);

  @override
  State<SearchMaskPage> createState() => _SearchMaskPage();
}

class _SearchMaskPage extends State<SearchMaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xffEEEEEE),
          elevation: 0,
          leadingWidth: 50,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.black,),
            onPressed: () {
              // 处理返回按钮点击事件
              Navigator.pop(context);
            },
          ),
          title: Center(
            child: Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: '搜索',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(bottom: 10)
                ),
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(fontSize: 17,),

              ),
            ),
          )

      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: ListView(
          children: [
            // 搜索李历史
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(top: 20, bottom: 20), child: Text('历史搜索', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),),),
                Wrap(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                      margin: EdgeInsets.only(right: 10,bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Text(
                        '青禾手机',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Text(
                        '青禾手机',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Text(
                        '青禾手机',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Text(
                        '青禾手机',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Text(
                        '青禾手机',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    )
                  ],
                )
              ],
            ),
            // 可横向滑动的部分
            Container(
              height: 350,
              margin: EdgeInsets.only(top: 50),
              child: GridView(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2,
                ),
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 350,
                    padding: EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10),
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color.fromRGBO(200, 74, 37, 1), Color.fromRGBO(243, 178, 160, 1)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                        )
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('1', style: TextStyle(fontSize: 16, color: Colors.deepOrangeAccent),),
                              Text('可德基疯狂星期四', style: TextStyle(fontSize: 14, color: Colors.black),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 350,
                    padding: EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10),
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color.fromRGBO(200, 74, 37, 1), Color.fromRGBO(243, 178, 160, 1)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                        )
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('1', style: TextStyle(fontSize: 16, color: Colors.deepOrangeAccent),),
                              Text('可德基疯狂星期四', style: TextStyle(fontSize: 14, color: Colors.black),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 350,
                    padding: EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color.fromRGBO(200, 74, 37, 1), Color.fromRGBO(243, 178, 160, 1)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                        )
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('1', style: TextStyle(fontSize: 16, color: Colors.deepOrangeAccent),),
                              Text('可德基疯狂星期四', style: TextStyle(fontSize: 14, color: Colors.black),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      )


    );
  }
}

