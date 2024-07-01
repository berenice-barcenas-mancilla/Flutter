//Anotaciones
/* 
En flutter child se refiere a un unico widget para representar el contenido principal
dentro de otro widget. Por ejemplo: en muchos widgets como container, center, columns, row
y entre otros; el child es el widget que se muestra dentro de ellos y ocupa todo el espacio disponible
segun las reglas del layout de flutter.
Children: se refiere a la lista de widgets que pueden pasar como argumentos en aquellos widgets que soportan
 */

import 'package:flutter/material.dart';
import 'package:lottus/servicios/database.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key:  _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Usuario'),
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return 'Por favor ingrese su usuario';
                  }
                  return null;
                },
                onSaved: (value){
                  _username = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return 'Por favor ingrese su contraseña';
                  }
                  return null;
                },
                onSaved: (value){
                  _username = value!;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}