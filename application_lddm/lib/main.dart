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

main() => runApp(const PerguntaApp());

class PerguntaApp extends StatelessWidget {
  const PerguntaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FinManage'),
          backgroundColor: const Color.fromARGB(255, 23, 73, 3),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: const Text('Flutter!',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            )),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(255, 23, 73, 3),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.home),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.account_balance_wallet),
                  onPressed: () {},
                  color: Colors.white,
                ),
                IconButton(
                  icon: const Icon(Icons.credit_card),
                  onPressed: () {},
                  color: Colors.white,
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {},
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 3, 26, 0),
      ),
    );
  }
}
}