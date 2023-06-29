import 'package:flutter/material.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);
  static const String routePath = 'game';
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Game page',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
