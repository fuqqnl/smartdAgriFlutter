import 'package:flutter/material.dart';
import 'splash_ad.dart';
import 'package:new_agriculture/pages/container_page.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  bool showAdPage = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Offstage(
          offstage: showAdPage,
          child: ContainerPage(),
        ),
        Offstage(
          offstage: !showAdPage,
          child: SplashAd(
            cb: () {
              // 广告页倒计时回调
              setState(() {
                showAdPage = false;
              });
            },
          ),
        )
      ],
    );
  }
}
