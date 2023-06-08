import 'package:flutter/material.dart';

class WeatherNowCard extends StatefulWidget {
  const WeatherNowCard({Key? key}) : super(key: key);

  @override
  State<WeatherNowCard> createState() => _WeatherNowCardState();
}

class _WeatherNowCardState extends State<WeatherNowCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        clipBehavior: Clip.none, // 内容溢出的处理
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            // 背景(TODO需要动态改变)
            Container(
              height: 400,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0x77888888), Color(0x22999999)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft
                )
              ),
            )
          ],
        )
      ),
    );
  }
}
