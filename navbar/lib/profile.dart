import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // 2. Cree un formulario con una clave global
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String lastName = '';
  String email = '';
  String phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Nombre
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  icon: Icon(Icons.person),
                ),
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return 'Por favor ingrese su nombre';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value ?? '';
                },
              ),
              // Apellido
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Apellido',
                  icon: Icon(Icons.person),
                ),
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return 'Por favor ingrese su apellido';
                  }
                  return null;
                },
                onSaved: (value) {
                  lastName = value ?? '';
                },
              ),
              // Email
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return 'Por favor ingrese su email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)) {
                    return 'Por favor ingrese un email válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value ?? '';
                },
              ),
              // Teléfono
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  icon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if ((value ?? '').isEmpty) {
                    return 'Por favor ingrese su teléfono';
                  }
                  if (!RegExp(r'^\+?\d{10,15}$').hasMatch(value!)) {
                    return 'Por favor ingrese un número de teléfono válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  phone = value ?? '';
                },
              ),
              // Botón de enviar
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Procesa los datos
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Procesando datos')),
                      );
                    }
                  },
                  child: Text('Guardar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
