import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabLayout(),
    );
  }
}

class TabLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Número de abas
      child: Scaffold(
        appBar: AppBar(
          title: Text('Layout com Abas'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Aba 1'),
              Tab(text: 'Aba 2'),
              Tab(text: 'Aba 3'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
// Conteúdo da Aba 1
            Center(
              child: Text('Conteúdo da Aba 1'),
            ),
// Conteúdo da Aba 2
            Center(
              child: Text('Conteúdo da Aba 2'),
            ),
// Conteúdo da Aba 3
            Center(
              child: Text('Conteúdo da Aba 3'),
            ),
          ],
        ),
      ),
    );
  }
}
