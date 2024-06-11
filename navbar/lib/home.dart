import 'package:flutter/material.dart';
import 'all.dart';
import 'cocina.dart';
import 'recamara.dart';
import 'lineablanca.dart';
import 'sala.dart';
import 'package:dismissible_carousel_viewpager/dismissible_carousel_viewpager.dart';


class HomePage extends StatelessWidget {
  /*final es una cosntante que puede cambiar su valor al inicio
  y después su valor es inmutable */
  final List<String> img =[  
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
      // Agregar widget de menú hamburguesa Drawer
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
            // Agregar elementos ListTile al Drawer
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
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
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.kitchen),
              title: Text("Cocina"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cocina()),
                );
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.bed),
              title: Text("Recamara"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => recamara()),
                );
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.local_laundry_service),
              title: Text("Línea blanca"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => lineablanca()),
                );
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.weekend),
              title: Text("Sala de estar"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => sala()),
                );
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child:DismissibleCarouselViewPager(
              itemBuilder: (BuildContext context, int index) {
                return
 
                Container(
                  child: Center(
                    child: Image.asset(
                      img[index],
                      fit: BoxFit.cover,
                      height: 400.0, // Ajusta la altura de la imagen
                      width: 600.0, // Ajusta el ancho de la imagen
                 
                    ),
                  ),
                );
              },
              itemCount: img.length,
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