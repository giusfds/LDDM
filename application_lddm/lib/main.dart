import 'package:flutter/material.dart';
import 'BackGroud.dart';
import 'MainPage.dart';

void main() async {
  // Certificar que tudo foi inicializado corretamente
  WidgetsFlutterBinding.ensureInitialized();
  
  // chamar o background (certifique-se de que configureBackground() exista)
  // pensar mehor nisso, ja que precisa da aprovacao da pessoa 
  await configureBackground();

  runApp(const HomePage());
}
