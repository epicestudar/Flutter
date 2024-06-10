import 'package:exemplo2_firebase/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'todolist_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira um email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Senha'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insira uma senha';
                    }
                    return null;
                  },
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (){_validarLogin();},
                  child: const Text("Logar"),)
              ],
            ),
          ),
        ),
      )
    );
  }
  
  Future<void> _validarLogin() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        User? user = await _authService.signInWithEmail(
          _emailController.text,
          _passwordController.text,
        );
        if (user != null){
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(
            builder: (context)=>TodolistScreen(user:user)));}
        else{
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Usuário ou senha inválidos"),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
    }
  }
}