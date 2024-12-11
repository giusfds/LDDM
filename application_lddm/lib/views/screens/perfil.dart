import 'package:application_lddm/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'globo.dart';
import 'login.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:application_lddm/entitis/userProviders.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtendo as informações do usuário do UserProvider
    final usuario = Provider.of<UserProvider>(context).usuario;

    // Verificando se o usuário está presente
    if (usuario == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Perfil")),
        body: Center(child: Text("Nenhum usuário encontrado.")),
      );
    }

    void deletar() async {
        print(usuario.id);
        final url = Uri.parse('https://lddm.onrender.com/usuario/${usuario.id}');
        final response = await http.delete(url);

        if (response.statusCode == 200) {
          // Limpa os dados do usuário e vai para a tela de login
          Provider.of<UserProvider>(context, listen: false);
          Navigator.pushReplacement(
            context,
            PageTransition(
                child: LoginScreen(), type: PageTransitionType.bottomToTop),
          );
        } else {
          // Exibe uma mensagem de erro
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Falha ao deletar o perfil! Tente novamente."),
              backgroundColor: Colors.red,
            ),
          );
        }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('WorldChat'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Imagem de perfil
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(usuario.getImagem()),
              ),
              SizedBox(height: 16),
              // Nome, Idade, Língua Nativa
              Text(
                'Nome: ${usuario.nome}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Idade: ${usuario.idade}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              // Dropdown de Língua Nativa
              DropdownButton<String>(
                value: usuario.getLingua(),
                onChanged: (String? newValue) {
                  // Lógica para alterar a língua nativa, se necessário
                },
                items: [usuario.getLingua()]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              // Local onde mora
              Text(
                'Local onde mora: ${usuario.local}',
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
              SizedBox(height: 16),
              // Botão de Sair (voltar para a tela de login)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      child: LoginScreen(), // Tela de login
                      type: PageTransitionType.bottomToTop,
                    ),
                  );
                },
                child: Text("Sair"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: deletar, // Passa a função como referência
                child: Text('Deletar Perfil'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
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
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            // Navegação para a tela de países
            Navigator.push(
              context,
              PageTransition(
                child:
                    CountryLanguageScreen(), // Altere para a tela correspondente
                type: PageTransitionType.leftToRight,
              ),
            );
          } else if (index == 1) {
            // Navegação para a tela de chat
            Navigator.push(
              context,
              PageTransition(
                child: MyHomePage(), // Altere para a tela correspondente
                type: PageTransitionType.leftToRight,
              ),
            );
          } else if (index == 2) {
            // Navegação para a tela de perfil (já está nesta tela)
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
