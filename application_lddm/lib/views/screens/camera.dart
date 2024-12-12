import 'dart:io';

import 'package:application_lddm/views/screens/perfil.dart';
import 'package:application_lddm/views/screens/traducao.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:application_lddm/services/GeminiApiService.dart';

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

  late GeminiApiService _geminiService;

  @override
  void initState() {
    super.initState();
    _geminiService = GeminiApiService();
    _initializeCamera();
  }

  // Inicialização da Câmera
  void _initializeCamera() async {
    cameras = await availableCameras();

    if (cameras != null && cameras!.isNotEmpty) {
      _controller = CameraController(cameras![0], ResolutionPreset.high);
      await _controller?.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

Future<void> _takePictureAndSendToGemini() async {
  if (!_controller!.value.isInitialized || _controller!.value.isTakingPicture) {
    return;
  }
  try {
    final XFile picture = await _controller!.takePicture();
    final File imageFile = File(picture.path);
    const prompt =
        "Transcreva o texto, traduzindo ele e retorne a tradução informando o idioma original e o idioma traduzido, nao diga frases a mais além do que foi pedido.";

    final result = await _geminiService.uploadAndProcessImage(imageFile, prompt);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Resultado da Transcrição"),
        content: Text(result ?? "Erro ao processar a imagem."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  } catch (e) {
    print("Erro ao processar imagem: $e");
  }
}

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WorldChat - Camera'),
      ),
      body: _isCameraInitialized
          ? Stack(
              children: [
                // Exibe a câmera ocupando todo o espaço disponível
                Positioned.fill(
                  child: CameraPreview(_controller!),
                ),
                // Botão centralizado na tela
                Center(
                  child: ElevatedButton.icon(
                    onPressed: _takePictureAndSendToGemini,
                    icon: Icon(Icons.camera_alt, size: 24),
                    label: Text(""),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(), backgroundColor: Colors.black.withOpacity(0.5),
                      padding: EdgeInsets.all(16), // Cor do botão
                    ),
                  ),
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
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