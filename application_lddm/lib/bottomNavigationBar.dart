import 'package:application_lddm/Globo.dart';
import 'package:application_lddm/MainPage.dart';
import 'package:application_lddm/Perfil.dart';
import 'package:flutter/material.dart';


class Bottomnavigationbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.public), // Ícone de globo
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CountryLanguageScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.chat), // Ícone de chat
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person), // Ícone de perfil de usuário
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
