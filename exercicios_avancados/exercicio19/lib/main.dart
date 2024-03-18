import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botões Interativos',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Botões Interativos'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ElevatedButton com ícone e cor personalizada
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text('Adicionar'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20), // Espaçamento entre os botões
              // TextButton com cor e estilo de texto personalizados
              TextButton(
                onPressed: () {},
                child: Text(
                  'Cancelar',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 20), // Espaçamento entre os botões
              // OutlinedButton com ícone personalizado e bordas arredondadas
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.info),
                label: Text('Informações'),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
