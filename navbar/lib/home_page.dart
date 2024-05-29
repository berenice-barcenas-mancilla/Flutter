import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'), // Debe ser una cadena de texto
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 226, 65, 119),
              ),
              child: Text(
                "Menu",
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ), // <-- Coma añadida aquí
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"), 
              onTap: () {
                Navigator.pop(context); 
              }, 
            ),
            
          ],
        ),
      ), 
      body: const Center(
        child: Text("Welcome to the Home Page!"),
      ),
    );
  }
}
