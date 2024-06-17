import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //página com dois botoes(listar e cadastrar) produto
      appBar: AppBar(
        title: Text('Produtos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context,'/listar'), 
            child: const Text('Listar')),
          const SizedBox(height: 12,),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context,'/cadastrar'), 
            child: const Text('Cadastrar')),
          const SizedBox(height: 12,),

        ],),
      ),


    );
  }
}