import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projeto_json/Controller/filmes_controller.dart';

class FilmeScreen extends StatefulWidget {
  const FilmeScreen({super.key});

  @override
  State<FilmeScreen> createState() => _FilmeScreenState();
}

class _FilmeScreenState extends State<FilmeScreen> {
  // atributos
  FilmeController _controller = FilmeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Expanded(
          child: FutureBuilder(
              future: _controller.loadJson(),
              builder: (context, snapshot) {
                if (_controller.listFilmes.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemCount: _controller.listFilmes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_controller.listFilmes[index].nome),
                        subtitle: Text("${_controller.listFilmes[index].categoria} | ${_controller.listFilmes[index].duracao} min"),
                        leading: Image.file(
                            File(_controller.listFilmes[index].imagens)),
                        onTap: () {},
                      );
                    },
                  );
                }
              }),
        ),
      ),
    );
  }
}