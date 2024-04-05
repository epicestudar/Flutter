// Classe responsável por exibir a página inicial do aplicativo
import 'package:exemplo_sqlite/db_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbHelper = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();

  // Controllers para os campos de texto
  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _address1Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Demo'),
      ),
      body: FutureBuilder<List<ContactModel>>(
        future: dbHelper.getContacts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No contacts found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final contact = snapshot.data![index];
                return ListTile(
                  title: Text(contact.name),
                  subtitle: Text(contact.email),
                  onTap: () {
                    // Implement onTap functionality
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddContactDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Método para exibir um diálogo para adicionar um novo contato
  void _showAddContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Contact'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _idController,
                  decoration: InputDecoration(labelText: 'ID'),
                  keyboardType: TextInputType
                      .number, // Define o tipo de teclado para numérico
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter
                        .digitsOnly // Permite apenas a entrada de dígitos
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an ID';
                    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter a valid ID (only digits allowed)';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone'),
                ),
                TextFormField(
                  controller: _address1Controller,
                  decoration: InputDecoration(labelText: 'Address Line 1'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addContact();
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // Método para adicionar um novo contato ao banco de dados
  void _addContact() {
    final newContact = ContactModel(
      id: int.parse(_idController.text),
      name: _nameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
      addressLine1: _address1Controller.text,
    );

    dbHelper.create(newContact);
    setState(() {
      // Atualiza a lista de contatos
    });
  }
}