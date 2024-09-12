import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
                value: 'Idioma',
                items: <String>['Idioma', 'Português', 'Inglês'].map((String value) {
                  // colocar a parte funcional aqui @GLkaiky
                  // aqui e tipo as opcoes que temos para colcoar de lingua no app
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Ativar'),
              // @GLKaiky!
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.public), // Ícone do globo
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
