// treino.dart

class Treino {
  String nome;
  bool concluido;

  Treino({required this.nome, required this.concluido});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'concluido': concluido ? '1' : '0',
    };
  }

  factory Treino.fromMap(String mapString) {
    Map<String, dynamic> map = Map.fromIterable(
      mapString.replaceAll("{", "").replaceAll("}", "").split(", "),
      key: (e) => e.split(": ")[0],
      value: (e) => e.split(": ")[1],
    );

    return Treino(
      nome: map['nome'],
      concluido: map['concluido'] == '1',
    );
  }
}
