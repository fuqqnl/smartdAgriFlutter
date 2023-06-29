/**
* 购物车页面
*
 */
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('购物车页面'),
    );
  }
}
