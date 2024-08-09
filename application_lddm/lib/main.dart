import 'package:flutter/material.dart';

void main() {
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
            child: Text('o famoso hello word!'),
          ),
        ),
      ),
    ),
  );
}
