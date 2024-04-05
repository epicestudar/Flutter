import 'package:atividade_somativa2/Model/usuario.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String DATABASE_NAME = 'usuarios.db'; // Nome do banco de dados
  static const String TABLE_NAME = 'usuarios'; // Nome da tabela
  static const String
      CREATE_CONTACTS_TABLE_SCRIPT = // Script SQL para criar a tabela
      "CREATE TABLE contacts(id INTEGER PRIMARY KEY," +
          "nome TEXT, email TEXT, senha TEXT," +
          "phone TEXT)";

  
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(
          await getDatabasesPath(), DATABASE_NAME), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(
            CREATE_CONTACTS_TABLE_SCRIPT); // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }
  // Método para criar um novo contato no banco de dados
  Future<void> create(UsuarioModel model) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
          TABLE_NAME, model.toMap()); // Insere o contato no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para obter todos os contatos do banco de dados
  Future<List<UsuarioModel>> getContacts() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps =
          await db.query(TABLE_NAME); // Consulta todos os contatos na tabela

      return List.generate(
        maps.length,
        (i) {
          return UsuarioModel.fromMap(maps[
              i]); // Converte os resultados da consulta para objetos UsuarioModel
        },
      );
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  // Método para atualizar um contato no banco de dados
  Future<void> update(UsuarioModel model) async {
    try {
      final Database db = await _getDatabase();
      await db.update(
        TABLE_NAME,
        model.toMap(),
        where: "id = ?", // Condição para atualizar o contato com base no ID
        whereArgs: [model.id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para excluir um contato do banco de dados
  Future<void> delete(int id) async {
    try {
      final Database db = await _getDatabase();
      await db.delete(
        TABLE_NAME,
        where: "id = ?", // Condição para excluir o contato com base no ID
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}