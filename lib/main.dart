import 'package:flutter/material.dart';
import 'package:new_agriculture/pages/Game/Game.dart';
import 'package:new_agriculture/screens/splash/splash_screen.dart';
import 'package:new_agriculture/pages/community/community.dart';
import 'package:new_agriculture/pages/weather/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          primaryColor: const Color(0xFF0A0E21), // 顶部bar的颜色
          scaffoldBackgroundColor: const Color(0xFF0A0E21), // 主体内容背景色
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: Color(0xFF555555),
            ),
            bodyMedium: TextStyle(
              color: Color(0xFF555555),
            ),
            bodySmall: TextStyle(
              color: Color(0xFF555555),
            ),
          ),
        ),
        routes: {
          '/home/weather': (context) => const Weather(),
          '/home/community': (context) => const CommunityPage(),
          '/home/game': (context) => const Game(),
        },
        home: const Scaffold(
          body: SplashScreen(),
        ));
  }
}
