// camera_page.dart
import 'package:application_lddm/views/screens/perfil.dart';
import 'package:application_lddm/views/screens/traducao.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// Use alias para evitar conflitos entre bibliotecas
import 'package:google_ml_kit/google_ml_kit.dart' as mlkit;
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart' as mlkit_text_recognition;
import 'package:page_transition/page_transition.dart';

import 'globo.dart';
import 'home.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  //Inicialização da Camera
  void _initializeCamera() async {

    //Esperando a camera até quando estiver disponivel.
    cameras = await availableCameras();

    if (cameras != null && cameras!.isNotEmpty) {
      _controller = CameraController(cameras![0], ResolutionPreset.high);
      await _controller?.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  // Função para tirar a foto
  void _takePicture() async {
    if (_controller != null && _controller!.value.isInitialized) {
      XFile picture = await _controller!.takePicture();
      _processImage(picture);
    }
  }

  // Função para processar a imagem e extrair texto com OCR
  void _processImage(XFile image) async {

    // Usando alias para InputImage
    final mlkit_text_recognition.InputImage inputImage = mlkit_text_recognition.InputImage.fromFilePath(image.path);
    final mlkit_text_recognition.TextRecognizer textRecognizer = mlkit_text_recognition.TextRecognizer();
    final mlkit_text_recognition.RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    String scannedText = recognizedText.text;
    print('=========|| Texto Escaneado: $scannedText');

    // Exemplo de uso do texto escaneado
    textRecognizer.close();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('WorldChat - Camera'),
      ),

      body: _isCameraInitialized
          ? CameraPreview(_controller!)
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        child: Icon(Icons.camera),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.language), label: 'País'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Camera'),
          BottomNavigationBarItem(icon: Icon(Icons.text_fields), label: 'Tradução'),
        ],
        currentIndex: 3,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              PageTransition(child: CountryLanguageScreen(), type: PageTransitionType.leftToRight),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              PageTransition(child: UserProfileScreen(), type: PageTransitionType.rightToLeft),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              PageTransition(child: CameraPage(), type: PageTransitionType.rightToLeft),
            );
          } else if (index == 4) {
            Navigator.push(
              context,
              PageTransition(child: Traducao(), type: PageTransitionType.rightToLeft),
            );
          }
        },
      ),
    );
  }
}
