import 'package:flutter/material.dart';
import 'splash/splash_widget.dart';

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
        theme: ThemeData(backgroundColor: Colors.white),
        home: const Scaffold(
          body: SplashWidget(),
        )
    );
  }
}

