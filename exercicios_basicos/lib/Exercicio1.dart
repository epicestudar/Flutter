import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercício 1"),
        ),
        body: Column(children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: Text("Container 1"),
          ),
           Container(
            width: 150,
            height: 150,
            color: Colors.red,
            child: Text("Container 2"),
          ),
           Container(
            width: 200,
            height: 200,
            color: Colors.green,
            child: Text("Container 3"),
          )
        ]),
      ),
    );
  }
}
