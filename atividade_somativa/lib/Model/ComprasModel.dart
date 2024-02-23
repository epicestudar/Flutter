class Compra {
  String descricao;
  bool concluida;
  DateTime dataHora;
  int quantidade; // Novo campo para armazenar a quantidade

  Compra(this.descricao, this.concluida, this.dataHora, {this.quantidade = 1});
}

