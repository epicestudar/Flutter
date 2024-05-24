import 'package:flutter/material.dart';

import '../Controller/weather_controller.dart';

class CityDetailsScreen extends StatefulWidget {
  final String city;
  const CityDetailsScreen({super.key, required this.city});

  @override
  State<CityDetailsScreen> createState() => _CityDetailsScreenState();
}

class _CityDetailsScreenState extends State<CityDetailsScreen> {
  final WeatherController _controller = WeatherController();
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child:Center(
          child: FutureBuilder(
            future: _controller.getFromWeatherService(widget.city), 
            builder: (context,snapshot){
              if(_controller.listWeather.isEmpty){
                return CircularProgressIndicator();
              }else{
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_controller.listWeather.last.city),
                        //favorite icon
                        IconButton(
                          icon: isFavorited ? Icon(Icons.favorite):Icon(Icons.favorite_border_outlined),
                          onPressed: (){
                            setState(() {
                              isFavorited = !isFavorited;
                            });
                            //criar a função para favoritar
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 12,),
                    Text(_controller.listWeather.last.description),
                    const SizedBox(height: 12,),
                    Text((_controller.listWeather.last.temp-273).toStringAsFixed(2)),
                    const SizedBox(height: 12,),
                  ],
                );
              }
            }),
        )),
      
    );
  }
}