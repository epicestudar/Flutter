import 'package:atividade_somativa2/Controller/database.dart';
import 'package:atividade_somativa2/Model/usuario.dart';
import 'package:atividade_somativa2/View/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: telefoneController,
              decoration: InputDecoration(
                labelText: 'Número de Telefone',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  UsuarioModel usuario = UsuarioModel(
                    nome: nomeController.text,
                    email: emailController.text,
                    senha: senhaController.text,
                    telefone: telefoneController.text,
                  );
                  await DatabaseHelper().create(usuario);
                  print('Usuário cadastrado com sucesso');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                } catch (ex) {
                  print('Erro ao cadastrar usuário: $ex');
                }
              },
              child: Text('Cadastre-se'),
            ),
          ],
        ),
      ),
    );
  }
}
