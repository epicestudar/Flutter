class Usuario {
  //atributos
  late int id;
  String nome;
  String email;
  String senha;
  //Construtor
  Usuario({required this.nome, required this.email, required this.senha, required id});

  Map<String, dynamic> toMap() {
     return {
      'u_nome': nome,
      'email': email,
      'senha': senha,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id:map['id'],
      nome: map['u_nome'],
      email: map['email'],
      senha: map['senha'],
    );
  }

}