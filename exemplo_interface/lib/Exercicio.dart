import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Informações Pessoais'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PessoaCard(
                nome: 'João',
                idade: 30,
                endereco: 'Rua A, 123',
                telefone: '(00) 1234-5678',
                email: 'joao@example.com',
              ),
              PessoaCard(
                nome: 'Maria',
                idade: 25,
                endereco: 'Rua B, 456',
                telefone: '(00) 9876-5432',
                email: 'maria@example.com',
              ),
              // Adicione mais PessoaCards conforme necessário
            ],
          ),
        ),
      ),
    );
  }
}

class PessoaCard extends StatelessWidget {
  final String nome;
  final int idade;
  final String endereco;
  final String telefone;
  final String email;

  const PessoaCard({
    required this.nome,
    required this.idade,
    required this.endereco,
    required this.telefone,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow(Icons.person, 'Nome: $nome'),
            SizedBox(height: 8.0),
            _buildRow(Icons.calendar_today, 'Idade: $idade'),
            _buildRow(Icons.location_on, 'Endereço: $endereco'),
            _buildRow(Icons.phone, 'Telefone: $telefone'),
            _buildRow(Icons.email, 'Email: $email'),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 8.0),
        Text(text),
      ],
    );
  }
}
