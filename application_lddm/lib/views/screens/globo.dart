<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
=======
import 'package:application_lddm/views/screens/traducao.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'camera.dart';
>>>>>>> 8a31e92c612980e6bc9681eaa3bf7e816dd29a3d
import 'home.dart';
import 'perfil.dart';

class CountryLanguageScreen extends StatefulWidget {
  @override
  _CountryLanguageScreenState createState() => _CountryLanguageScreenState();
}

class _CountryLanguageScreenState extends State<CountryLanguageScreen> {
  // Controladores para armazenar os valores inseridos no formulário
  TextEditingController _countryController = TextEditingController();
  TextEditingController _languageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WorldChat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título da página
            Text(
              'Diga o país onde mora e sua língua.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Campo de texto para o país
            TextField(
              controller: _countryController,
              decoration: InputDecoration(
                labelText: 'País',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Campo de texto para a língua
            TextField(
              controller: _languageController,
              decoration: InputDecoration(
                labelText: 'Língua',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32),

            // Imagem do globo
            Center(
              child: Image.asset(
                'assets/globe.png', // API DO MAPA :(
                height: 200,
                width: 200,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      // Coloque o BottomNavigationBar aqui, dentro do Scaffold
      bottomNavigationBar: BottomNavigationBar(
<<<<<<< HEAD
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'País',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: 0, // Selecionar a aba atual (0 é a primeira aba)
        onTap: (index) {
          if (index == 0) {
            // Navegação para a tela de países
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CountryLanguageScreen()),
            );
          } else if (index == 1) {
            // Navegação para a tela de chat
            Navigator.push(
              context,
              PageTransition(child: MyHomePage(), type: PageTransitionType.rightToLeft),
            );
          } else if (index == 2) {
            // Navegação para a tela de perfil
=======
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.language), label: 'País'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Camera'),
          BottomNavigationBarItem(icon: Icon(Icons.text_fields), label: 'Tradução'),
        ],
        currentIndex: 0,
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
>>>>>>> 8a31e92c612980e6bc9681eaa3bf7e816dd29a3d
            Navigator.push(
              context,
              PageTransition(child: UserProfileScreen(), type: PageTransitionType.rightToLeft),
            );
<<<<<<< HEAD
=======
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
>>>>>>> 8a31e92c612980e6bc9681eaa3bf7e816dd29a3d
          }
        },
      ),
    );
  }
}
<<<<<<< HEAD
    
=======
>>>>>>> 8a31e92c612980e6bc9681eaa3bf7e816dd29a3d
