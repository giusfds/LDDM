import 'package:application_lddm/views/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:provider/provider.dart';
import 'package:application_lddm/entitis/userProviders.dart';
<<<<<<< HEAD
=======
import 'package:flutter_dotenv/flutter_dotenv.dart';

>>>>>>> 8a31e92c612980e6bc9681eaa3bf7e816dd29a3d


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

<<<<<<< HEAD
void main() {
=======
void main() async{
  await dotenv.load(fileName: ".env");
>>>>>>> 8a31e92c612980e6bc9681eaa3bf7e816dd29a3d
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner:false,  
      home: LoginScreen(),
    );
  }
}

