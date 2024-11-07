import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'globo.dart';
import 'perfil.dart';
import 'package:application_lddm/services/languages.dart';

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
    loadLanguages(); // Carrega os idiomas ao iniciar o widget
  }

  Future<void> loadLanguages() async {
    languages = await fetchLanguages(); // Chama a função do outro arquivo
    setState(() {}); // Atualiza o estado para refletir a lista de idiomasdata

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
