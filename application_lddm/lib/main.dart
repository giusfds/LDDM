import 'package:application_lddm/views/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'views/screens/perfil.dart';
import 'views/screens/loadingInterface.dart';

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
  // Certificar que tudo foi inicializado corretamente
  //WidgetsFlutterBinding.ensureInitialized();
  // Chamar o background
 //      await configureBackground(); 

  // Iniciar o aplicativo
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,  
      home: SplashScreen(),
    );
  }
}

