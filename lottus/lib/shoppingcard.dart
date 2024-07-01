import 'package:flutter/material.dart';

class shoppingcard extends StatelessWidget {
    final Color secondaryColor = Color.fromRGBO(143, 148, 251, .6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        backgroundColor: secondaryColor,
      ),
      body: Center(
        child: Text('Shopping Cart Page Content'),
      ),
    );
  }
}
