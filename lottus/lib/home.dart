import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'profile.dart';
import 'specialprice.dart';
import 'shoppingcard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color primaryColor = Color.fromRGBO(143, 148, 251, 1);
  final Color secondaryColor = Color.fromRGBO(143, 148, 251, .6);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lottus Home',
      theme: ThemeData(
        primarySwatch: Colors.purple, // Colors.purple as a fallback
        primaryColor: primaryColor,
        // accentColor: secondaryColor,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    shoppingcard(),
    specialprice(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color.fromRGBO(143, 148, 251, 1);
    final Color secondaryColor = Color.fromRGBO(143, 148, 251, .6);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottus Home'),
        backgroundColor: primaryColor,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,              ),
              child: Text(
                'Filters',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.face_2),
              title: Text('Rostro'),
              onTap: () {
                // Acción de filtro para lipsticks
              },
            ),
            ListTile(
              leading: Icon(Icons.brush_rounded),
              title: Text('Mejillas'),
              onTap: () {
                // Acción de filtro para foundations
              },
            ),
            ListTile(
              leading: Icon(Icons.remove_red_eye),
              title: Text('Ojos'),
              onTap: () {
                // Acción de filtro para foundations
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text('Accesorios'),
              onTap: () {
                // Acción de filtro para foundations
              },
            ),
            ListTile(
              leading: Icon(Icons.local_florist),
              title: Text('Labios'),
              onTap: () {
                // Acción de filtro para mascaras
              },
            ),
            ListTile(
              leading: Icon(Icons.color_lens),
              title: Text('Uñas'),
              onTap: () {
                // Acción de filtro para mascaras
              },
            ),
            ListTile(
              leading: Icon(Icons.brush_rounded),
              title: Text('Brochas'),
              onTap: () {
                // Acción de filtro para mascaras
              },
            ),
            ListTile(
              leading: Icon(Icons.battery_full),
              title: Text('Aplicadores'),
              onTap: () {
                // Acción de filtro para mascaras
              },
            ),
            ListTile(
              leading: Icon(Icons.face_2),
              title: Text('Skincare'),
              onTap: () {
                // Acción de filtro para mascaras
              },
            ),
            ListTile(
              leading: Icon(Icons.grade_sharp),
              title: Text('Destacados'),
              onTap: () {
                // Acción de filtro para mascaras
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text('Ofertas'),
              onTap: () {
                // Acción de filtro para mascaras
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            activeIcon: Icon(Icons.home, color: primaryColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            activeIcon: Icon(Icons.shopping_cart, color: primaryColor),
            label: 'Shopping Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money, color: Colors.black),
            activeIcon: Icon(Icons.attach_money, color: primaryColor),
            label: 'Special Price',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            activeIcon: Icon(Icons.person, color: primaryColor),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final List<String> imgList = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 400.0,
          autoPlay: true,
          enlargeCenterPage: true,
          scrollDirection: Axis.vertical,
        ),
        items: imgList
            .map((item) => Container(
                  child: Center(
                    child: Image.asset(item, fit: BoxFit.cover, height: 400),
                  ),
                ))
            .toList(),
      ),
    );
  }
}