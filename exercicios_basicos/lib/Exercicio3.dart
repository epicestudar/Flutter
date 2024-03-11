import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView com Cards"),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: EdgeInsets.all(10),
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text('Item $index'),
                subtitle: Text('Informações fictícias'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  // Ação ao clicar no card (opcional)
                  print('Item $index clicado');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
