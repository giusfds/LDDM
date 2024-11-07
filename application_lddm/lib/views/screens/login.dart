import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'perfil.dart';
import 'cadastro.dart';
import 'package:application_lddm/entitis/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:application_lddm/entitis/userProviders.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para armazenar os valores inseridos no formulário
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Função para simular o processo de login
void _login() async {
  if (_formKey.currentState!.validate()) {
    final url = Uri.parse('http://localhost:3000/usuario/${_emailController.text}/${_passwordController.text}');
    final response = await http.get(url);

    if (response.statusCode == 201 || response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      Usuario usuario = Usuario.fromJson(jsonResponse);

      
      // Adiciona o usuário ao UserProvider
      Provider.of<UserProvider>(context, listen: false).setUsuario(usuario);
      
      // Navega para a próxima tela
      Navigator.pushReplacement(
        context,
        PageTransition(child: UserProfileScreen(), type: PageTransitionType.bottomToTop),
      );
    } else {
      print("Falha na autenticação");
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Center( // Use Center para centralizar o conteúdo verticalmente
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Alinha tudo no topo
          children: [
            // Container para a imagem
            Container(
              width: 205,
              height: 205,
              child: Image.asset(
                'assets/image/logo.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 32), // Espaço entre a imagem e o formulário
            // Formulário
            Form( 
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Campo de texto para o email
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira seu email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Por favor, insira um email válido';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16), // Espaço entre o campo de email e o próximo campo
                  
                  // Campo de texto para a senha
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Senha'),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira sua senha';
                      }
                      if (value.length < 6) {
                        return 'A senha deve ter pelo menos 6 caracteres';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 32), // Espaço para separar os campos do botão

                  // Botão para realizar o login
                  ElevatedButton(
                    onPressed: _login,
                    child: Text('Entrar'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50), 
                      // Largura fixa para o botão
                    ),
                  ),
                  SizedBox(height: 20),

                    GestureDetector(
                      onTap: (){
                      },
                      child: Text(
                        'Esqueci minha senha',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          decoration: TextDecoration.underline
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, 
                        PageTransition(child: UserRegistrationScreen(), type: PageTransitionType.fade));
                      },
                      child: Text(
                        'Registre-se',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          decoration: TextDecoration.underline
                        ),
                      )
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
