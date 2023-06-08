import 'package:flutter/material.dart';
import 'package:new_agriculture/pages/crops/crops.dart';
import 'package:new_agriculture/pages/details/communityPage/community.dart';

import '../details/weatherPage/weather-for-webview.dart';

class ControllerItem extends StatefulWidget {
  final ControllerInterface item;
  const ControllerItem({Key? key, required this.item}) : super(key: key);

  @override
  State<ControllerItem> createState() => _ControllerItemState();
}

class _ControllerItemState extends State<ControllerItem> {
  double _controller_item_opacity = 1.0;
  @override
  Widget build(BuildContext context) {
    ControllerInterface item = widget.item;
    return Container(
      height: 110,
        decoration: BoxDecoration(
          // color: Color(0x77000000),
        ),
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            _controller_item_opacity = 0.5;
          });
        },
        onTapUp: (_) {
          setState(() {
            _controller_item_opacity = 1.0;
            Navigator.push
              (
                context,
                MaterialPageRoute(
                    builder: (BuildContext context){
                      switch (item.type) {
                        case 'weather':
                          return WeatherForWebview();
                        case 'community':
                          return CommunityPage();
                        case 'expert':
                          return WeatherForWebview();
                        default:
                          {
                            return WeatherForWebview();
                          }
                      }
                      // location组件目前没有用
                      // return Location();
                    }
                ),
            );

          });
        },

        child: Opacity(
          opacity: _controller_item_opacity,
          child: ListTile(
            leading: Image.network(item.icon, width: 50,height: 50,),
            title: Text(item.title, style: TextStyle(fontSize: 18, color: Colors.white)),
            subtitle: Text(item.subtitle, style: TextStyle(fontSize: 14, color: Colors.white)),
            trailing: Icon(Icons.arrow_forward_ios, size: 24, color: Colors.white),
          ),
        )
      )
    );
  }
}
