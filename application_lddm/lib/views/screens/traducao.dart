import 'package:application_lddm/views/screens/perfil.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'camera.dart';
import 'globo.dart';
import 'home.dart';

class Traducao extends StatefulWidget {
  @override
  _Traducao createState() => _Traducao();
}

class _Traducao extends State<Traducao> {

  //Controle de texto
  final TextEditingController _controller = TextEditingController();
  String texto = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WorldChat'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'País',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _showText,
                child: Text(
                  'Mostrar Texto',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                texto.isEmpty ? 'Texto não digitado ainda.' : texto,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
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
        currentIndex: 4,
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

  //PASSANDO DO "_controller.text" PARA "texto". PARA TRADUÇÃO, TRADUZA O "_controller.text" PARA O "texto".
  void _showText() {
    setState(() {
      texto = _controller.text;
      texto = '${texto}abs';
    });
  }
}