import 'package:flutter/material.dart';

class UserRegistrationScreen extends StatefulWidget {
  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para armazenar os valores inseridos no formulário
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Variável para armazenar a língua nativa selecionada
  String? _selectedLanguage;
  List<String> _languages = ['Português', 'Inglês', 'Espanhol'];

  // Variável para armazenar a imagem de perfil
  String? _profileImage = 'https://example.com/profile-image.jpg'; // Placeholder 

  void _selectProfileImage() {
    // Substituir isso pela implementação real de escolha de imagem
    setState(() {
      _profileImage = 'https://example.com/new-profile-image.jpg'; // URL simulada
    });
  }

  // Função para salvar o formulário
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      // Aqui você faria a lógica de salvar os dados no banco
      // @GLKaiky
      print('Nome: ${_nameController.text}');
      print('Idade: ${_ageController.text}');
      print('Língua nativa: $_selectedLanguage');
      print('Local: ${_locationController.text}');
      print('Email: ${_emailController.text}');
      print('Login: ${_loginController.text}');
      print('Senha: ${_passwordController.text}');
      print('Imagem de perfil: $_profileImage');
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campo de texto para o nome
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Campo de texto para a idade
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua idade';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor, insira um número válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Dropdown para selecionar a língua nativa
              DropdownButtonFormField<String>(
                value: _selectedLanguage,
                hint: Text('Selecione sua língua nativa'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLanguage = newValue;
                  });
                },
                items: _languages.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, selecione uma língua nativa';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              // Campo de texto para o local
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Local de residência'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu local de residência';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
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
              SizedBox(height: 16),
              // Campo de texto para o login
              TextFormField(
                controller: _loginController,
                decoration: InputDecoration(labelText: 'Nome de Usuario'),
                // fazer teste para saber se ja existe
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu login';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
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
              SizedBox(height: 16),

              // Seção para a imagem de perfil
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(_profileImage!),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _selectProfileImage,
                    child: Text('Selecionar Imagem de Perfil'),
                  ),
                ],
              ),
              Spacer(),

              // Botão para salvar o cadastro
              ElevatedButton(
                onPressed: _saveForm,
                child: Center(child: Text('Cadastrar')),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
