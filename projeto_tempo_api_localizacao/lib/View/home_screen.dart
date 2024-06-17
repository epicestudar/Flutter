import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../Controller/weather_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherController _controller = WeatherController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getWeatherInit();
  }

  Future <void> _getWeatherInit() async{
    try {
      Position position = await Geolocator.getCurrentPosition();
      _controller.getWeatherbyLocation(
        position.latitude, position.longitude
        );
      setState(() {
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Previsão do Tempo"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {Navigator.pushNamed(context,'/search');}, 
                        child: const Text("Search")),
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Favoritos"))
                  ],
                ),
                const SizedBox(height: 20),
                    _controller.weatherList.isEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Erro de Conexão"),
                          IconButton(
                            icon: const Icon(Icons.refresh),
                            onPressed: () {
                              _getWeatherInit();
                            },
                          )
                        ],
                      )
                    : Column(
                        children: [
                          Text(_controller.weatherList.last.name),
                          const SizedBox(height: 10),
                          Text(_controller.weatherList.last.main),
                          const SizedBox(height: 10),
                          Text(_controller.weatherList.last.description),
                          const SizedBox(height: 10),
                          Text((_controller.weatherList.last.temp-273).toStringAsFixed(2)),
                          IconButton(
                            icon: const Icon(Icons.refresh),
                            onPressed: () {
                              _getWeatherInit();
                            },
                          )
                        ],
                      )
              ],
            )));
  }
}
