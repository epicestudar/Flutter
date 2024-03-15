import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationsPage(),
    );
  }
}

class AnimationsPage extends StatefulWidget {
  @override
  _AnimationsPageState createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage> {
  bool tapped = false;
  double size = 150;
  double fontSize = 20;
  final duration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => setState(() => tapped = !tapped),
        child: Center(
          child: Container(
            width: tapped ? size * 2 : size,
            height: tapped ? size * 2 : size,
            decoration: BoxDecoration(
              color: tapped ? Colors.black : Colors.black54,
              borderRadius: BorderRadius.all(Radius.circular(60)), // Remove 'const' from here
            ),
            child: Center(
              child: AnimatedDefaultTextStyle(
                duration: duration,
                style: TextStyle(
                  fontSize: tapped ? fontSize * 3 : fontSize,
                ),
                child: const Text('Ola mundo'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
