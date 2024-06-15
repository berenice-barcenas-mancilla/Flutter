import 'package:flutter/material.dart';

class shoppingcard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Text('Shopping Cart Page Content'),
      ),
    );
  }
}
