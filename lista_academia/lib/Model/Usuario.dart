class Usuario {
  late int id;
  String nome;
  String email;
  String senha;

  Usuario({required this.nome, required this.email, required this.senha, required id});

  Map<String, dynamic> toMap() {
     return {
      'nome_usuario': nome,
      'email': email,
      'senha': senha,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id:map['id'],
      nome: map['nome_usuario'],
      email: map['email'],
      senha: map['senha'],
    );
  }
}
