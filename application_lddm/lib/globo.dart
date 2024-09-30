import 'package:flutter/material.dart';

import 'bottomNavigationBar.dart';

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
          ],
        ),
      ),
      bottomNavigationBar: Bottomnavigationbar(),
    );
  }
}
