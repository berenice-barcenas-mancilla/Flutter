import 'package:flutter/material.dart';
import 'all.dart';
import 'kitchet.dart';
import 'bed.dart';
import 'white_line.dart';
import 'living_room.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  final List<String> img = [
    'assets/img/1.jpg',
    'assets/img/2.jpg',
    'assets/img/3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Text(
                "Menu",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Todo"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllPage()),
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.kitchen),
              title: Text("Cocina"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CocinaPage()),
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.bed),
              title: Text("Recamara"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecamaraPage()),
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.local_laundry_service),
              title: Text("Línea blanca"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LineaBlancaPage()),
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.weekend),
              title: Text("Sala de estar"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SalaDeEstarPage()),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: img.map((item) => Container(
                child: Center(
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: 1000,
                  ),
                ),
              )).toList(),
            ),
          ),
          Center(
            child: Text('Welcome to the Home Page!'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
