import 'package:projeto_tempo_api_localizacao/Service/city_db_service.dart';

import '../Model/city_db_model.dart';

class CityDbController {
  //atributo
  List<City> _cities = [];
  final CityDataBaseService _dbService = CityDataBaseService();
  //get
  List<City> cities() => _cities;

  //métodos
  //List<Cities> 
  Future<List<City>> listCities() async{
    List<Map<String,dynamic>> maps = await _dbService.getAllCities();
    _cities = maps.map<City>((e) => City.fromMap(e)).toList();
    return _cities;
  }
  //addCities
  Future<void> addCities(City city) async{
    _dbService.insertCity(city);
  }
}