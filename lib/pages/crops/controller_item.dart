import 'package:flutter/material.dart';
import 'package:new_agriculture/pages/crops/crops.dart';
import 'package:new_agriculture/pages/details/communityPage/community.dart';
// 一些好看的图标插件
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../details/weatherPage/weather-for-webview.dart';

class ControllerItem extends StatefulWidget {
  final dynamic item;
  const ControllerItem({Key? key, required this.item}) : super(key: key);

  @override
  State<ControllerItem> createState() => _ControllerItemState();
}

class _ControllerItemState extends State<ControllerItem> {
  double _controller_item_opacity = 1.0;
  String title = '';
  String subtitle = '';
  String type = '';

  @override
  void initState() {
    super.initState();
    updateUI(widget.item);
  }

  void updateUI(dynamic itemData) {
    title = itemData['title'];
    subtitle = itemData['subtitle'];
    type = itemData['type'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(),
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            _controller_item_opacity = 0.5;
          });
        },
        onTapUp: (_) {
          setState(() {
            _controller_item_opacity = 1.0;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  switch (type) {
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
                },
              ),
            );
          });
        },
        child: Opacity(
          opacity: _controller_item_opacity,
          child: ListTile(
            leading: const Icon(
              FontAwesomeIcons.airbnb,
              size: 60,
            ),
            title: Text(title,
                style: const TextStyle(fontSize: 18, color: Colors.white)),
            subtitle: Text(subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.white)),
            trailing: const Icon(Icons.arrow_forward_ios,
                size: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
