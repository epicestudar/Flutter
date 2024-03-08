import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercício 3"),
        ),
        body: ListView.builder(
          itemCount: 10,
           itemBuilder: (BuildContext context, int index)
        )
      ),
    )
  }
}