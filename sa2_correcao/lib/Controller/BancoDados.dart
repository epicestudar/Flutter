
import 'package:path/path.dart';
import 'package:sa2_correcao/Model/Usuario.dart';
import 'package:sqflite/sqflite.dart';

class BancoDadosCrud {
  static const String Nome_BD = 'usuarios.db'; // Nome do banco de dados
  static const String Nome_Tabela = 'usuarios'; // Nome da tabela
  static const String
      Script_Criacao_Tabela = // Script SQL para criar a tabela
      "CREATE TABLE IF NOT EXISTS usuarios("+
        "id SERIAL PRIMARY KEY," +
          "u_nome TEXT, email TEXT UNIQUE," +
          "senha TEXT)";

  
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(
          await getDatabasesPath(), Nome_BD), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(
            Script_Criacao_Tabela); // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }
  // Método para criar um novo contato no banco de dados
  Future<void> create(Usuario usuario) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
          Nome_Tabela, usuario.toMap()); // Insere o contato no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para obter o dado do usuario
  Future<Usuario?> getUsuario(String email, String senha) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps =
          await db.query(Nome_Tabela,
          where: 'email = ? AND senha = ?',
          whereArgs: [email,senha]
          ); // Consulta todos os contatos na tabela

      if (maps.isNotEmpty){
        return Usuario.fromMap(maps[0]);
      }else{
        return null;
      }
    } catch (ex) {
      print(ex);
      return null;
    }
  }
  // Método para verificar existência do usuario
  Future<bool> existsUsuario(String email, String senha) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps =
          await db.query(Nome_Tabela,
          where: 'email = ? AND senha = ?',
          whereArgs: [email,senha]
          ); // Consulta todos os contatos na tabela

      if (maps.isNotEmpty){
        return true;
      }else{
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }
}