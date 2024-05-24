import 'package:projeto_tempo_api_localizacao/Service/city_db_service.dart';

import '../Model/city_db_model.dart';

class CityDbController {
  List<CityDB> _cities = [];
  final CityDbService _service = CityDbService();
  List<CityDB> getCities() => _cities;

  Future<List<CityDB>> getAllCities() async {
    try {
      List<Map<String,dynamic>> maps = await _service.getAllCities();
      for(Map<String,dynamic> map in maps){
        _cities.add(CityDB.fromMap(map));
      }
      //_cities = maps.map<CityDb>((e) => CityDb.fromMap(e)).toList();
      
      return _cities;
    } catch (e) {
      print(e);
      return _cities;
    }
  }

  Future<void> create(CityDB db) async {
    try {
      await _service.insertCity(db);
      print("inserted");
    } catch (e) {
      print(e);
    }
  }

}