import 'package:flutter/material.dart';

class specialprice extends StatelessWidget {
    final Color secondaryColor = Color.fromRGBO(143, 148, 251, .6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Special Price'),
        backgroundColor: secondaryColor,
      ),
      body: Center(
        child: Text('Special Price Page Content'),
      ),
    );
  }
}
