import 'package:flutter/material.dart';
import 'home.dart';
import 'profile.dart';
import 'specialprice.dart';
import 'shoppingcard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: Home(),
      routes: {
        '/home': (context) => Home(),
        '/profile': (context) => profile(),
        '/specialprice': (context) => specialprice(),
        '/shoppingcard': (context) => shoppingcard(),
      },
    );
  }
}
