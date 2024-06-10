
class Todolist {
  //atributos
  final String id;
  final String titulo;
  final String userId;
  final DateTime timestamp;

  Todolist({required this.id, required this.titulo, required this.userId, required this.timestamp});
  
  //toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'userId': userId,
      'timestamp': timestamp.toIso8601String(),
    };
  }
  //fromJson
  factory Todolist.fromJson(Map<String, dynamic> json) {
    return Todolist(
      id: json['id'],
      titulo: json['titulo'],
      userId: json['userId'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

        
  }
