import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercício 11"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround, // alinhamento vertical
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home, size: 50, color: Colors.white),
                        SizedBox(height: 10),
                        Text("Item 1", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    color: Color.fromARGB(255, 49, 221, 86),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.work, size: 50, color: Colors.white),
                        SizedBox(height: 10),
                        Text("Item 2", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    color: Color.fromARGB(255, 51, 96, 243),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Text("Item 3", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
