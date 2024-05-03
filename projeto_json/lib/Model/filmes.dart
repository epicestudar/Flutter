// - Nome; - Text
//     - Genero/Categoria; - Text
//     - Sinopse; - Text
//     - Duração; - Int minutos
//     - Ano; - Int
//     - Classificação; - Text
//     - Elenco; - <Text>
//     - Imagens - <Text>
class Filme {
  final String nome;
  final String genero;
  final String sinopse;
  final int duracao;
  final int ano;
  final String classificacao;
  final List<String> elenco;
  final String imagem;

  Filme({
    required this.nome,
    required this.genero,
    required this.sinopse,
    required this.duracao,
    required this.ano,
    required this.classificacao,
    required this.elenco,
    required this.imagem,
  });

  Map<String, dynamic> toJson() => {
        'nome': nome,
        'genero': genero,
        'sinopse': sinopse,
        'duracao': duracao,
        'ano': ano,
        'classificacao': classificacao,
        'elenco': elenco,
        'imagem': imagem,
      };

  factory Filme.fromJson(Map<String, dynamic> json) {
    return Filme(
      nome: json['nome'],
      genero: json['genero'],
      sinopse: json['sinopse'],
      duracao: json['duracao'],
      ano: json['ano'],
      classificacao: json['classificacao'],
      elenco: json['elenco'],
      imagem: json['imagem'],
    );
  }
}
