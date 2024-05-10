import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FilmeCadastroScreen extends StatefulWidget {
  const FilmeCadastroScreen({super.key});

  @override
  State<FilmeCadastroScreen> createState() => _FilmeCadastroScreenState();
}

class _FilmeCadastroScreenState extends State<FilmeCadastroScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _sinopseController = TextEditingController();
  final TextEditingController _duracaoController = TextEditingController();
  final TextEditingController _anoController = TextEditingController();
  final TextEditingController _classificacaoController = TextEditingController();
  final TextEditingController _elencoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Filme'),
      ),
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               TextFormField(
                  decoration: const InputDecoration(hintText: "Nome do Filme"),
                  controller: _nomeController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Nome do Filme deve ser Preenchido";
                    } else {
                      return null;
                    }
                  }),
              TextFormField(
                  decoration: const InputDecoration(hintText: "Gênero do Filme"),
                  controller: _generoController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Gênero do Filme deve ser Preenchido";
                    } else {
                      return null;
                    }
                  }),
              TextFormField(
                  decoration: const InputDecoration(hintText: "Sinopse do Filme"),
                  controller: _sinopseController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Sinopse do Filme deve ser Preenchido";
                    } else {
                      return null;
                    }
                  }),
              TextFormField(
                  decoration: const InputDecoration(hintText: "Duração do Filme"),
                  controller: _duracaoController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Duração do Filme deve ser Preenchido";
                    } else {
                      return null;
                    }
                  }),
              TextFormField(
                  decoration: const InputDecoration(hintText: "Ano do Filme"),
                  controller: _anoController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Ano do Filme deve ser Preenchido";
                    } else {
                      return null;
                    }
                  }),
              TextFormField(
                  decoration: const InputDecoration(hintText: "Classificação do Filme"),
                  controller: _classificacaoController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Classificação do Filme deve ser Preenchido";
                    } else {
                      return null;
                    }
                  }),
              TextFormField(
                  decoration: const InputDecoration(hintText: "Elenco do Filme - Separe por vírgula"),
                  controller: _elencoController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Elenco do Filme deve ser Preenchido";
                    } else {
                      return null;
                    }
                  }),
              ElevatedButton(onPressed: () => {
                if(_formkey.currentState!.validate()) {
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

  Future<void> _tirarFoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _imagemSelecionada = File(pickedFile.path);
    });
  }
  
  void _cadastrarFilme() {}
}
