import 'package:exemplo2_firebase/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodolistScreen extends StatefulWidget {
  final User user;
  const TodolistScreen({super.key, required this.user});

  @override
  State<TodolistScreen> createState() => _TodolistScreenState();
}

class _TodolistScreenState extends State<TodolistScreen> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todolist'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              
            })]
      ),
      body: Center(
        child: Text('Todolist'),
      ),
    );
  }
}