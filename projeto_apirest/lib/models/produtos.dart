class Produto {
  //atrbutos
  final String id;
  final String nome;
  final String preco;

  Produto({required this.id, required this.nome, required this.preco});

  //TO JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
    };
  }
  //FROM JSON
  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'] is int ? json['id'] :int.parse(json['id']),
      nome: (json['nome']).toString(),
      preco: json['preco'] is double ? json['preco'] : double.parse(json['preco']),
    );
  }

}
