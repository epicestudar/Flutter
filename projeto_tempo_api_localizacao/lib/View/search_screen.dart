import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _cityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Search City"),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child:Form(
            key:_formKey,
            child:Column(
              children:[
                TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    labelText: 'Enter City',
                  ),
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'Please enter city';
                    }
                    return null;
                  },
                )
              ]
            )
          )
        ),
      )
    );
  }
}