import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
            UserAccountsDrawerHeader(accountName: Text('epicestudar'), accountEmail: Text('vinicius@gmail.com')),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                // ações de clique
                onTap: () {
                  print('home');
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Sair'),
                // ações de clique
                onTap: () {
                  print('sair');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Menu Hamburger'),
        ),
      ),
    );
  }
}
