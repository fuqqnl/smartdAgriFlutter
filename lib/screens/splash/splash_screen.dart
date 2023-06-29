import 'package:flutter/material.dart';
import 'components/splash_ad.dart';
import 'package:new_agriculture/screens/container_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
