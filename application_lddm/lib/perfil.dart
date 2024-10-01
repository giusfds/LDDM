import 'package:application_lddm/home.dart';
import 'package:flutter/material.dart';
import 'globo.dart';

class UserProfileScreen extends StatelessWidget {
  // Variáveis que virão do banco de dados
  final String NOME_BD = '';
  final int IDADE_BD = 0;
  final String LINGUA_NATIVA_BD = '';
  final String LOCAL_BD = '';
  final String IMAGEM_PERFIL_BD = ''; // URL da foto de perfil
  final List<String> LINGUAS_BD = [
    ''
  ]; // dropdown com as linguagens usadas recentemente

  @override
  Widget build(BuildContext context) {
    // Variável para controlar a seleção da língua
    String? selectedLanguage = LINGUA_NATIVA_BD;

    return Scaffold(
      appBar: AppBar(
        title: Text('WorldChat'),
      ),
      body: Center( // Adicionei o Center aqui
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Imagem de perfil
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(IMAGEM_PERFIL_BD),
              ),
              SizedBox(height: 16),
              // Nome, Idade, Língua Nativa
              Text(
                '*Nome*: $NOME_BD',
                style: TextStyle(fontSize: 18), 
              ),
              Text(
                '*Idade*: $IDADE_BD',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              // Dropdown de Língua Nativa
              DropdownButton<String>(
                value: selectedLanguage,
                onChanged: (String? newValue) {
                  selectedLanguage = newValue!;
                },
                items: LINGUAS_BD.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              // Local onde mora
              Text(
                '*Local onde mora*: $LOCAL_BD',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              // Botão de histórico de línguas
              ElevatedButton.icon(
                onPressed: () {
                  // Ação ao clicar no botão
                },
                icon: Icon(Icons.history),
                label: Text('Histórico de Línguas'),
              ),
              SizedBox(height: 16), // Adicionei um espaço aqui
              // Botão de UpgCountryLanguageScreen
            ],
          ),
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
            currentIndex: 2, // Selecionar a aba atual (0 é a primeira aba)
            onTap: (index) {
              if (index == 0) {
                // Navegação para a tela de países
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CountryLanguageScreen()), // Substitua por sua tela
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
                  MaterialPageRoute(builder: (context) => UserProfileScreen()),
                );
              }
            },
          ),
      );
  }
}
  