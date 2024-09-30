import 'package:application_lddm/bottomNavigationBar.dart';
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
      bottomNavigationBar: Bottomnavigationbar(),
    );
  }
}
