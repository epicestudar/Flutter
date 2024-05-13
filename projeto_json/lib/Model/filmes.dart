class Filme {
  final String nome;
  final String categoria;
  final String sinopse;
  final int duracao;
  final int ano;
  final int classificacao;
  final String elenco;
  final String imagens;

  Filme(
      {required this.nome,
      required this.categoria,
      required this.sinopse,
      required this.duracao,
      required this.ano,
      required this.classificacao,
      required this.elenco,
      required this.imagens});

  factory Filme.fromJson(Map<String, dynamic> json) {
    return Filme(
      nome: json['nome'],
      categoria: json['categoria'],
      sinopse: json['sinopse'],
      duracao: json['duracao'],
      ano: json['ano'],
      classificacao: json['classificacao'],
      elenco: json['elenco'],
      imagens: json['imagens'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'categoria': categoria,
      'sinopse': sinopse,
      'duracao': duracao,
      'ano': ano,
      'classificacao': classificacao,
      'elenco': elenco,
      'imagens': imagens,
    };
  }
}