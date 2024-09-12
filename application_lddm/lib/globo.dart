import 'package:flutter/material.dart';

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

            // Barra de navegação inferior
            BottomNavigationBar(
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
                // Função para mudar entre as telas
                // Navigator.push(...) se necessário
              },
            ),
          ],
        ),
      ),
    );
  }
}
