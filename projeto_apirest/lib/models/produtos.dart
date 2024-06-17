class Produto {
  //atributos
  final String id;
  final String nome;
  final String codigo;
  final double preco;

  Produto({required this.id, required this.nome, required this.codigo, required this.preco});
  
  //tojson
  Map<String, dynamic> toJson() => {
    'id': id,
    'nome': nome,
    'codigo': codigo,
    'preco': preco
  };
  //fromJson
  factory Produto.fromJson(Map<String, dynamic> json) => Produto(
    id: (json['id']).toString(),
    nome: json['nome'],
    codigo: json['codigo'],
    preco: json['preco'] is double ? json['preco'] : double.parse(json['preco'].toString())
  );


}