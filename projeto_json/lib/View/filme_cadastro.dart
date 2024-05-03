import 'package:flutter/material.dart';

class FilmeCadastroScreen extends StatefulWidget {
  const FilmeCadastroScreen({super.key});

  @override
  State<FilmeCadastroScreen> createState() => _FilmeCadastroScreenState();
}

class _FilmeCadastroScreenState extends State<FilmeCadastroScreen> {
  final TextEditingController _nomeController = TextEditingController as TextEditingController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Filme'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(hintText: "Nome do Filme"),
                controller: _nomeController,
                validator: (value) {
                  if(value!.trim().isEmpty) {
                    return "";
                  } else {
                    return null;
                  }
                },
              ),
              ElevatedButton(onPressed: () => {
                if(_formKey.currentState!.validate()) {
                  _cadastrarFilme()
                }
              },
               child: const Text('Cadastrar')),
            ],
          ),
        ),
      ),
    );
  }
  
  void _cadastrarFilme() {}
}
