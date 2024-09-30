import 'package:flutter/material.dart';
import 'bottomNavigationBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        body: const Text(
          'Flutter!',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: Bottomnavigationbar(),
        backgroundColor: const Color.fromARGB(255, 3, 26, 0),
      ),
    );
  }
}
