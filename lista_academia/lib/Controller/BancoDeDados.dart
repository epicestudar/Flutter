import 'package:path/path.dart';
import 'package:lista_academia/Model/Usuario.dart';
import 'package:sqflite/sqflite.dart';

class BancoDados {
   static const String Nome_BD = 'academia.db';
  static const String Tabela_Usuarios = 'usuarios';
  static const String Tabela_Treinos = 'treinos';
  static const String Script_Criacao_Tabela = // Script SQL para criar a tabela
      "CREATE TABLE IF NOT EXISTS usuarios(" +
          "id SERIAL PRIMARY KEY," +
          "nome_usuario TEXT, email TEXT UNIQUE," +
          "senha TEXT)";
    static const String Script_Criacao_Tabela_Treinos =
      "CREATE TABLE IF NOT EXISTS $Tabela_Treinos(" +
      "id INTEGER PRIMARY KEY AUTOINCREMENT," +
      "nome TEXT, concluido INTEGER)";

  Future<Database> _getDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), Nome_BD),
    onCreate: (db, version) async {
      await db.execute(Script_Criacao_Tabela);
      await db.execute(Script_Criacao_Tabela_Treinos); // Adiciona a tabela de treinos
    },
    version: 1,
  );
}


  // Método para criar um novo contato no banco de dados
  Future<void> create(Usuario usuario) async {
  try {
    final Database db = await _getDatabase();
    
    // Verificar se o email já está cadastrado
    final exists = await existsUsuario(usuario.email, usuario.senha);
    if (exists) {
      throw Exception('O e-mail já está cadastrado.');
    }

    await db.insert(
      Tabela_Usuarios,
      usuario.toMap(),
    );
  } catch (ex) {
    print(ex);
    return;
  }
}


  // Método para obter o dado do usuario
  Future<Usuario?> getUsuario(String email, String senha) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(Tabela_Usuarios,
          where: 'email = ? AND senha = ?',
          whereArgs: [email, senha]); // Consulta todos os contatos na tabela

      if (maps.isNotEmpty) {
        return Usuario.fromMap(maps[0]);
      } else {
        return null;
      }
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  Future<bool> existsUsuario(String email, String senha) async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(Tabela_Usuarios,
          where: 'email = ? AND senha = ?',
          whereArgs: [email, senha]); // Consulta todos os contatos na tabela

      if (maps.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }  
}
