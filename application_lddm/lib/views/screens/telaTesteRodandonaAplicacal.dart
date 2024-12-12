import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:io';
import 'package:flutter_background/flutter_background.dart';

Future<void> configureBackground() async {
  const androidConfig = FlutterBackgroundAndroidConfig(
    notificationTitle: "App rodando em Background",   
    notificationText: "Esse é um teste feito em android",
    notificationImportance: AndroidNotificationImportance.normal,
    notificationIcon: AndroidResource(name: 'logo', defType: 'drawable'),
  );

  bool success =
      await FlutterBackground.initialize(androidConfig: androidConfig);

  if (success) {
    print("Deu boa");
    await FlutterBackground.enableBackgroundExecution();
  } else {
    print('Fudeu');     
  }
} 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureBackground();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorldChat',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _options = [
    'Tradução de Texto (Print ou Foto)',
    'Identificar País por Imagem',
    'Identificar Idioma',
    'Pesquisa de Textos Relacionados'
  ];

  String? _selectedOption;
  String _inputText = "";
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _sendToBackend() {
    if (_selectedOption == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, selecione uma opção.')),
      );
      return;
    }

    print('Opção Selecionada: $_selectedOption');
    print('Texto de Entrada: $_inputText');
    if (_image != null) print('Imagem Selecionada: ${_image!.path}');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Dados enviados para a IA!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WorldChat'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: _selectedOption,
              hint: Text('Selecione uma opção'),
              isExpanded: true,
              items: _options.map((option) {
                return DropdownMenuItem(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                });
              },
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Texto de entrada (opcional)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _inputText = value;
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Tirar Foto ou Selecionar Imagem'),
            ),
            if (_image != null) ...[
              SizedBox(height: 16),
              Image.file(_image!, height: 200),
            ],
            Spacer(),
            ElevatedButton(
              onPressed: _sendToBackend,
              child: Text('Enviar para IA'),
            ),
          ],
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
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              PageTransition(
                child: CountryLanguageScreen(),
                type: PageTransitionType.leftToRight,
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              PageTransition(
                child: UserProfileScreen(),
                type: PageTransitionType.rightToLeft,
              ),
            );
          }
        },
      ),
    );
  }
}

class CountryLanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Países')),
      body: Center(
        child: Text('Tela de Países'),
      ),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil')),
      body: Center(
        child: Text('Tela de Perfil'),
      ),
    );
  }
}
