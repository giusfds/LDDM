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