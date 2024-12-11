import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CameraExample extends StatefulWidget {
  @override
  _CameraExampleState createState() => _CameraExampleState();
}


class _CameraExampleState extends State<CameraExample> {

  // Variável para foto
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Função para abrir a câmera
  Future<void> _openCamera() async {

    try {

      //Abre a camera
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

      //Verifica se tirou uma foto
      if (image != null) {

        setState(() {
          _image = File(image.path); // Atualiza a imagme
        });
      }
    }
    catch (e) {
      print("Erro ao acessar a câmera: $e");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Tirar Foto'),
      ),

      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center, // Centraliza os elementos na tela
          children: [

            // Condições caso tenha sido tirado uma foto
            _image == null
                ? Text('Nenhuma imagem capturada')
                : Image.file(_image!),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openCamera,
              child: Text('Abrir Câmera'),
            ),
          ],
        ),
      ),
    );
  }
}