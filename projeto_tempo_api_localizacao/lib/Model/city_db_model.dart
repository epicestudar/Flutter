class CityDB {
  int? id;
  final String cityName;
  final int favoritesCities;

  CityDB(
      {this.id,
      required this.cityName,
      required this.favoritesCities});
  
  //toMap
  Map<String,dynamic> toMap() {
    return {
      'cityname': this.cityName,
      'favoritescities': this.favoritesCities
    };
  }
  //fromMap
  factory CityDB.fromMap(Map<String,dynamic> map){
    return CityDB(
      id: map['id'],
      cityName: map['cityname'],
      favoritesCities: map['favoritescities']
    );
  }
}