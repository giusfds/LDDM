import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';

  Future<void> configureBackground() async{
    const androidConfig = FlutterBackgroundAndroidConfig(
      notificationTitle: "App rodando em BackGround",
      notificationText: "Esse e um teste feito em android",
      notificationImportance: AndroidNotificationImportance.normal,
        notificationIcon: AndroidResource(name: 'logo', defType: 'drawable'),
    );
    bool sucess =   await FlutterBackground.initialize(androidConfig: androidConfig);

    if(sucess){
      print("Deu boa");
      await FlutterBackground.enableBackgroundExecution();
    }else{
      print('Fudeu');
    }
  }


void main() async{
  //Certificar que tudo foi inicializado corretamente
  WidgetsFlutterBinding.ensureInitialized();
  //chamar o background
  await configureBackground();

  // creating a materialwpp widget
  // widget => Object
  runApp(
    MaterialApp(
      home: Scaffold(
        // "center a div"
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(9, 0, 191, 255),
                Color.fromARGB(8, 2, 84, 111),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

            )
          ),
          child:const Center(
            child: Text('boa'),
          ),
        ),
      ),
    ),
  );
}
