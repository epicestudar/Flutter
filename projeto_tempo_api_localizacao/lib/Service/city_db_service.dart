import 'package:path/path.dart';
import 'package:projeto_tempo_api_localizacao/Model/city_db_model.dart';
import 'package:sqflite/sqflite.dart';

class CityDbService {
  static const String DB_NOME = 'db.db'; // Nome do banco de dados
  static const String TABLE_NOME = 'cities'; // Nome da tabela
  static const String CREATE_CONTACTS_TABLE_SCRIPT = // Script SQL para criar a tabela
      """CREATE TABLE cities(
        id SERIAL,
        cityname TEXT,
        favoritescities BOOLEAN)""";


  
  Future<Database> _getDatabase() async{
    return openDatabase(
      join(await getDatabasesPath(), DB_NOME), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(
            CREATE_CONTACTS_TABLE_SCRIPT); // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }

  Future<List<Map<String, dynamic>>> getAllCities() async{
    Database db = await _getDatabase();
    List<Map<String, dynamic>> result = await db.query(TABLE_NOME);
    db.close();
    return result;
  }

  Future<void> insertCity(CityDB city) async{
    Database db = await _getDatabase();
    await db.insert(TABLE_NOME, city.toMap());
    db.close();
  }

  Future<void> updateCity(CityDB city) async{
    Database db = await _getDatabase();
    await db.update(
        TABLE_NOME, 
        city.toMap(), 
        where: 'cityname =?', 
        whereArgs: [city.cityName]);
    db.close();
  }

  Future<void> deleteCity(CityDB city) async{
    Database db = await _getDatabase();
    await db.delete(
        TABLE_NOME, 
        where: 'cityname =?', 
        whereArgs: [city.cityName]);
    db.close();
  }

  Future<List<Map<String,dynamic>>> getCity(String cityName) async{
    Database db = await _getDatabase();
    List<Map<String, dynamic>> result = await db.query(TABLE_NOME, 
        where: 'cityname =?', 
        whereArgs: [cityName]);
    db.close();
    return result;
  }
}