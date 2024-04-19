import 'package:flutter/material.dart';
import 'package:sa2_correcao/Model/Usuario.dart';

import '../Controller/BancoDados.dart';

class PaginaCadastro extends StatefulWidget {
  @override
  _PaginaCadastroState createState() => _PaginaCadastroState();
}

class _PaginaCadastroState extends State<PaginaCadastro> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  void cadastrarUsuario(BuildContext context) async {
    String name = _nomeController.text;
    String email = _emailController.text;
    String password = _senhaController.text;

    Usuario usuario = Usuario(nome: name, email: email, senha: password, id: null);

    BancoDadosCrud bancoDados = BancoDadosCrud();
    try {
      bancoDados.create(usuario);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário cadastrado com sucesso!')),
      );
      Navigator.pop(context); // Redireciona para a tela de login
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao cadastrar usuário: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Página de Cadastro"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Cadastro',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Por favor, insira seu nome';
                    }
                    if (!RegExp(r'^[a-zA-ZÀ-ú-\s]+$').hasMatch(value!)) {
                      return 'Nome inválido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'E-mail'),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Por favor, insira seu e-mail';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value!)) {
                      return 'E-mail inválido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _senhaController,
                  decoration: InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Por favor, insira sua senha';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      cadastrarUsuario(context);
                    }
                  },
                  child: Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}