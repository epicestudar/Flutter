import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Layout Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResponsiveLayoutDemo(),
    );
  }
}

class ResponsiveLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Layout Demo'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              // Layout para telas pequenas (por exemplo, smartphones)
              return _buildSmallLayout();
            } else if (constraints.maxWidth < 1200) {
              // Layout para telas médias (por exemplo, tablets)
              return _buildMediumLayout();
            } else {
              // Layout para telas grandes (por exemplo, desktops)
              return _buildLargeLayout();
            }
          },
        ),
      ),
    );
  }

  Widget _buildSmallLayout() {
    return Container(
      child: Text(
        'Layout para telas pequenas',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _buildMediumLayout() {
    return Container(
      child: Text(
        'Layout para telas médias',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Widget _buildLargeLayout() {
    return Container(
      child: Text(
        'Layout para telas grandes',
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
