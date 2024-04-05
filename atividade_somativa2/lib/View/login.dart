import 'package:atividade_somativa2/Controller/database.dart';
import 'package:atividade_somativa2/View/cadastro.dart';
import 'package:atividade_somativa2/View/logado.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            ElevatedButton(
              onPressed: () async {
                // Verificar login
                List<Map<String, dynamic>> queryRows =
                    (await DatabaseHelper().getContacts())
                        .cast<Map<String, dynamic>>();
                bool loginSuccessful = false;
                for (var row in queryRows) {
                  if (row['email'] == emailController.text &&
                      row['senha'] == senhaController.text) {
                    loginSuccessful = true;
                    break;
                  }
                }
                if (loginSuccessful) {
                  // Navegar para a página interna
                  print('Login bem-sucedido!');
                  // Aqui você pode navegar para a página interna
                } else {
                  print('Email ou senha inválidos');
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogadoPage()),
                );
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadastroPage()),
                );
              },
              child: Text('Não possui uma conta? Crie a sua aqui!'),
            ),
          ],
        ),
      ),
    );
  }
}
