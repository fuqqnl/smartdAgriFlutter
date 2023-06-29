import 'package:flutter/material.dart';
// 一些好看的图标插件
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_agriculture/pages/Game/Game.dart';
import 'package:new_agriculture/pages/community/community.dart';
import 'package:new_agriculture/pages/weather/weather.dart';

class ControllerItem extends StatefulWidget {
  final dynamic item;
  const ControllerItem({Key? key, required this.item}) : super(key: key);

  @override
  State<ControllerItem> createState() => _ControllerItemState();
}

class _ControllerItemState extends State<ControllerItem> {
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
      margin: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          switch (type) {
            case 'weather':
              Navigator.pushNamed(context, Weather.routePath);
              break;
            case 'community':
              Navigator.pushNamed(context, CommunityPage.routePath);
              break;
            case 'game':
              Navigator.pushNamed(context, Game.routePath);
              break;
          }
        },
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
    );
  }
}
