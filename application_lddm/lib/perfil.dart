import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  // Variáveis que virão do banco de dados
  final String NOME_BD = '';
  final int IDADE_BD = 0;
  final String LINGUA_NATIVA_BD = '';
  final String LOCAL_BD = '';
  final String IMAGEM_PERFIL_BD = ''; // URL da foto de perfil
  final List<String> LINGUAS_BD = ['']; // dropdown com as linguagens usadas recentemente

  @override
  Widget build(BuildContext context) {
    // Variável para controlar a seleção da língua
    String? selectedLanguage = LINGUA_NATIVA_BD;

    return Scaffold(
      appBar: AppBar(
        title: Text('WorldChat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            Spacer(),
            // Botão de Upgrade
            ElevatedButton(
              style: ElevatedButton.styleFrom(

                // NAO SEI CONCERTAR ESSE ERRO

                primary: Colors.yellow, // Cor do fundo do botão
                onPrimary: Colors.black, // Cor do texto do botão
              ),
              onPressed: () {
                // Ação para upgrade
              },
              child: Text('Upgrade \$'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.public), // Ícone de globo
              onPressed: () {
                // Ação para navegação ao conteúdo relacionado
              },
            ),
            IconButton(
              icon: Icon(Icons.chat), // Ícone de chat
              onPressed: () {
                // Ação para navegação ao histórico de conversas
              },
            ),
            IconButton(
              icon: Icon(Icons.person), // Ícone de perfil de usuário
              onPressed: () {
                // Ação para navegação ao perfil do usuário
              },
            ),
          ],
        ),
      ),
    );
  }
}
