class City {
  //atributos
  final String cityName;
  final int favoriteCities;
  //cosntrutor
  City({required this.cityName, required this.favoriteCities});
  //metodos
  
  //toMap
  Map<String,dynamic> toMap() {
    return {
    'cityname': cityName,
    'favoritecities': favoriteCities};
  }

  //fromMap
  factory City.fromMap(Map<String,dynamic> map ) {
    return City(
      cityName: map['cityname'],
      favoriteCities:map['favoritecities'],
    );
  }
}