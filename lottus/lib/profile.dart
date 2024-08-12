import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Color secondaryColor = Color.fromRGBO(143, 148, 251, .6);
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = image;
      });
    }
  }

  void _saveProfilePicture() {
    // Aquí puedes agregar la lógica para guardar la foto de perfil.
    // Por ejemplo, subir la imagen a un servidor o guardarla localmente.
    // Se puede usar la variable _imageFile para obtener la imagen seleccionada.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Foto de perfil guardada')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: secondaryColor,
        automaticallyImplyLeading: false, // Elimina la opción de regresar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: _imageFile == null
                  ? CircleAvatar(
                      radius: 50,
                      backgroundColor: secondaryColor,
                      child: IconButton(
                        icon: Icon(Icons.camera_alt, color: Colors.white),
                        onPressed: _pickImage,
                      ),
                    )
                  : CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(File(_imageFile!.path)),
                      child: IconButton(
                        icon: Icon(Icons.camera_alt, color: Colors.white),
                        onPressed: _pickImage,
                      ),
                    ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveProfilePicture,
              child: Text('Guardar Foto de Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}
