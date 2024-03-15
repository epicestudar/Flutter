import 'package:exercicio12/models/moeda.dart';

class MoedaRepository {
  static List<Moeda> tabela = [
    Moeda(nome: 'Bitcoin', sigla: 'BTC', preco: 164603.00),
    Moeda(nome: 'Ethereum', sigla: 'ETH', preco: 9716.00),
    Moeda(nome: 'XRP', sigla: 'XRP', preco: 3.34),
    Moeda(nome: 'Cardano', sigla: 'ADA', preco: 6.32),
    Moeda(nome: 'USD Coin', sigla: 'USDC', preco: 5.02),
    Moeda(nome: 'Litecoin', sigla: 'LTC', preco: 669.93),
  ];
}
