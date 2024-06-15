import 'package:flutter/material.dart';
import 'profile.dart';
import 'specialprice.dart';
import 'shoppingcard.dart';

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
    profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottus Home'),
        backgroundColor: Colors.pink,
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
                color: Colors.pink,
              ),
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
            ),ListTile(
              leading: Icon(Icons.brush_rounded),
              title: Text('Brochas'),
              onTap: () {
                // Acción de filtro para mascaras
              },
            ),ListTile(
              leading: Icon(Icons.battery_full),
              title: Text('Aplicadores'),
              onTap: () {
                // Acción de filtro para mascaras
              },
            ),ListTile(
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
            activeIcon: Icon(Icons.home, color: Colors.pink),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            activeIcon: Icon(Icons.shopping_cart, color: Colors.pink),
            label: 'Shopping Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money, color: Colors.black),
            activeIcon: Icon(Icons.attach_money, color: Colors.pink),
            label: 'Special Price',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            activeIcon: Icon(Icons.person, color: Colors.pink),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Page Content'),
    );
  }
}