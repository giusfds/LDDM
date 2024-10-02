import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'globo.dart';
import 'perfil.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedLanguage; // Variável para armazenar o idioma selecionado
  List<String> languages = []; // Lista para armazenar as línguas

  @override
  void initState() {
    super.initState();
    fetchLanguages(); // Chama a função para buscar as línguas
  }

Future<void> fetchLanguages() async {
  print("Fetching languages...");
    try {
      final response = await http.get(Uri.parse("https://restcountries.com/v3.1/all"));
      print("Response status: ${response.statusCode}");
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final Set<String> languageSet = {};

        for (var country in data) {
          if (country['languages'] != null) {
            // Adiciona as línguas ao conjunto, garantindo que sejam Strings
            country['languages'].forEach((key, value) {
              languageSet.add(value.toString());
            });
          }
        }

      setState(() {
        languages = languageSet.toList(); // Atualiza a lista de línguas
        languages = languageSet.toList()..sort();       
      }); 
    } else {
      throw Exception('Falha ao carregar as línguas');
    }
  } catch (e) {
    print("Erro: $e");
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WorldChat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: DropdownButton<String>(
                hint: Text('Selecione um idioma'), // Sugestão para o usuário
                value: selectedLanguage,
                items: languages.map((String lang) {
                  return DropdownMenuItem<String>(
                    value: lang,
                    child: Text(lang),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLanguage = newValue; // Atualiza o idioma selecionado
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Ação para o botão "Ativar"
                print("Idioma selecionado: $selectedLanguage");
              },
              child: Text('Ativar'),
            ),
          ],
        ),
      ),

      // Coloque o BottomNavigationBar aqui, dentro do Scaffold
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: 1, // Selecionar a aba atual (0 é a primeira aba)
        onTap: (index) {
          if (index == 0) {
            // Navegação para a tela de países
            Navigator.push(
              context,
              PageTransition(child: CountryLanguageScreen(), 
              type: PageTransitionType.leftToRight,
              ), // Substitua por sua tela
            );
          } else if (index == 1) {
            // Navegação para a tela de chat
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()), // Substitua por sua tela
            );
          } else if (index == 2) {
            // Navegação para a tela de perfil
            Navigator.push(
              context,
              PageTransition(child: UserProfileScreen(), type: PageTransitionType.rightToLeft ),
            );
          }
        },
      ),
    );
  }
}
