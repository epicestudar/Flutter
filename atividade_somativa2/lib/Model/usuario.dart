class UsuarioModel {
  int? id;
  String nome;
  String email;
  String senha;
  String telefone;

  UsuarioModel({
    this.id,
    required this.nome,
    required this.email,
    required this.senha,
    required this.telefone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'senha': senha,
      'phone': telefone,
    };
  }

  // Método de fábrica para criar um objeto ContactModel a partir de um mapa (para ler do banco de dados)
  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      senha: map['senha'],
      telefone: map['phone'],
    );
  }
}
