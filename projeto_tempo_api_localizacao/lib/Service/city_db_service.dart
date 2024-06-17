import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Model/city_db_model.dart';

class CityDataBaseService {
  static const String DB_NOME = 'cities.db'; // Nome do banco de dados
  static const String TABLE_NOME = 'cities'; // Nome da tabela
  static const String CREATE_TABLE_SCRIPT = // Script SQL para criar a tabela
      """CREATE TABLE cities( 
        cityname TEXT PRIMARY KEY, 
        favoritecities INTEGER)""";

  Future<Database> _getDatabase() async{
    return openDatabase(
      join(await getDatabasesPath(), DB_NOME), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(
            CREATE_TABLE_SCRIPT); // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }

  Future<List<Map<String,dynamic>>> getAllCities() async {
    try {
      Database db = await _getDatabase();
    List<Map<String, dynamic>> maps = await db.query(TABLE_NOME);
    db.close();
    return  maps;
    } catch (e) {
      print(e);
      return [];
    }
    
  }

  Future<void> insertCity(City city) async {
    try {
      Database db = await _getDatabase();
      db.insert(TABLE_NOME, city.toMap());
      db.close();
    } catch (e) {
      print(e);
      
    }
    
  }
  //update
  Future<void> updateCity(City city) async {
    try {
      Database db = await _getDatabase();
      db.update(TABLE_NOME, city.toMap(), 
        where: "cityname =?", 
        whereArgs: [city.cityName]
        );
      db.close();
    } catch (e) {
      print(e);
    }
  }
  //delete
  Future<void> deleteCity(String city) async {
    try {
      Database db = await _getDatabase();
      db.delete(TABLE_NOME,where: "cityname = ?",whereArgs: [city]);
      db.close();
    } catch (e) {
      
    }
  }
}