import 'package:flutter/material.dart';
import 'package:lista_academia/Model/Treino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaginaHome extends StatefulWidget {
  final String email;

  PaginaHome({required this.email});

  @override
  State<PaginaHome> createState() => _PaginaHomeState(email: email);
}

class _PaginaHomeState extends State<PaginaHome> {
  final String email;
  bool isDarkMode = false; // Adicionado para controlar o estado do tema

  _PaginaHomeState({required this.email});

  List<Treino> treinos = [];

  @override
  void initState() {
    super.initState();
    _carregarTreinos(email);
  }

  Future<void> _carregarTreinos(String email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? treinosString = prefs.getStringList('$email-treinos');

  if (treinosString != null) {
    setState(() {
      treinos = treinosString.map((e) => Treino.fromMap(e)).toList();
    });
  } else {
    // Caso não haja dados salvos, exibir treinos padrão
    setState(() {
      treinos = [
        Treino(nome: "Treino de Segunda", concluido: false),
        Treino(nome: "Treino de Terça", concluido: false),
        Treino(nome: "Treino de Quarta", concluido: false),
        // Adicione quantos treinos desejar
      ];
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode
          ? ThemeData.dark()
          : ThemeData.light(), // Aplicando tema escuro
      home: Scaffold(
        appBar: AppBar(
          title: Text('Página Inicial'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(); // Voltar para a página de login
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo, $email!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Lista de Treinos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: treinos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(treinos[index].nome),
                      trailing: Switch(
                        value: treinos[index].concluido,
                        onChanged: (value) async {
                          setState(() {
                            treinos[index].concluido = value;
                          });
                          _atualizarTreinosNoSharedPreferences();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              isDarkMode = !isDarkMode; // Alternar entre tema claro e escuro
            });
            _salvarPreferenciaTema(isDarkMode);
          },
          child: Icon(Icons.lightbulb), // Ícone para alternar o tema
        ),
      ),
    );
  }

  Future<void> _atualizarTreinosNoSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> treinosString =
        treinos.map((e) => e.toMap().toString()).toList();
    prefs.setStringList('$email-treinos', treinosString);
  }

  Future<void> _salvarPreferenciaTema(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode);
  }
}
