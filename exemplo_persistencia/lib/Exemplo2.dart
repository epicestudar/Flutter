import 'package:flutter/material.dart'; // Importação da biblioteca Flutter Material
import 'package:shared_preferences/shared_preferences.dart'; // Importação da biblioteca de preferências compartilhadas
 
void main() {
  runApp(MyApp()); // Execução do aplicativo Flutter
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas', // Título do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tema do aplicativo
      ),
      home: TaskListScreen(), // Tela inicial do aplicativo
    );
  }
}
 
class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}
 
class _TaskListScreenState extends State<TaskListScreen> {
  List<String> tasks = []; // Lista de tarefas
  final TextEditingController _controller =
      TextEditingController(); // Controlador de texto para o campo de entrada de nova tarefa
 
  @override
  void initState() {
    super.initState();
    loadTasks(); // Carrega as tarefas ao iniciar a tela
  }
 
  Future<void> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    setState(() {
      tasks = prefs.getStringList('tasks') ??
          []; // Carrega as tarefas armazenadas ou uma lista vazia se não houver tarefas
    });
  }
 
  Future<void> saveTasks() async {
    SharedPreferences prefs = await SharedPreferences
        .getInstance(); // Obtém as preferências compartilhadas
    await prefs.setStringList('tasks',
        tasks); // Salva a lista de tarefas nas preferências compartilhadas
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'), // Título da barra de aplicativos
      ),
      body: ListView.builder(
        itemCount: tasks.length, // Número de itens na lista de tarefas
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]), // Título do item da lista
            onLongPress: () {
              setState(() {
                tasks.removeAt(index); // Remove a tarefa da lista
                saveTasks(); // Salva as tarefas atualizadas
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Nova Tarefa'), // Título do diálogo de nova tarefa
                content: TextField(
                  controller:
                      _controller, // Controlador de texto para o campo de entrada
                  decoration: InputDecoration(
                      hintText: 'Digite a tarefa'), // Dica no campo de entrada
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        tasks.add(
                            _controller.text); // Adiciona a nova tarefa à lista
                        saveTasks(); // Salva as tarefas atualizadas
                        _controller.clear(); // Limpa o campo de entrada
                        Navigator.of(context).pop(); // Fecha o diálogo
                      });
                    },
                    child: Text('Adicionar'), // Botão para adicionar a tarefa
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add), // Ícone do botão de adicionar
      ),
    );
  }
}
