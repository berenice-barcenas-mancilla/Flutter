import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Text('Profile Page Content'),
      ),
    );
  }
}
