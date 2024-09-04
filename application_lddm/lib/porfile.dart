import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Similacao de um usuario, futuramente trocado para os dados da DataBase
    String profileImageUrl = 'https://example.com/profile.jpg'; // URL da foto de perfil do usuário
    String userName = 'Nome do Usuário'; // Nome do usuário
    String userEmail = 'usuario@exemplo.com'; // Email do usuário
    String userBio = 'Bio do usuário...'; // Bio ou outras informações do usuário

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                // Foto de perfil do usuário
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(profileImageUrl), // Puxa a imagem do perfil do usuário
                ),
                SizedBox(width: 16),
                // Informações do usuário
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      userName, // Puxa o nome do usuário
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      userEmail, // Puxa o email do usuário
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      userBio, // Puxa outras informações ou bio do usuário
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            // Botão para ver o histórico de línguas usadas pelo usuário
            ElevatedButton(
              onPressed: () {
                // Ação para o botão de histórico (ainda não implementada) @GLKaiky
              },
              child: Text('Histórico'),
            ),
            SizedBox(height: 20),
            // Botão para o upgrade
            ElevatedButton(
              onPressed: () {
                // Ação para o botão de upgrade 
                // nao sei se vai ser emplementada ainda... possivelmente que sim
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
              icon: Icon(Icons.emoji_emotions),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
