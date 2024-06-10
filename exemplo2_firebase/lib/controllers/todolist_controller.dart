import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/todolist.dart';

class TodolistController{
  List<Todolist> _list = [];
  List<Todolist> get list => _list;
  //classe firebase firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //métodos 
  //add
  Future<void> add(Todolist todo) async{
    await _firestore.collection('todolist').add(todo.toMap());
  }

  //delete
  Future<void> delete(String id) async{
    await _firestore.collection('todolist').doc(id).delete();
  }

  //listar
  Future<List<Todolist>> listar(String userId) async{
    final result = await _firestore
        .collection('todolist')
        .where('userId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .get();


    _list = result.docs.map((doc) => 
    Todolist.fromJson(doc.data())).toList();
    
    return _list;
  }
  


}