import 'package:applistamoedas/src/models/Detalhes.dart';

List<Moeda> moedas = [];

class Moeda {
  String? currencyName;
  String? cotation;
  String? symbol;
  String? imageUrl;
  Moeda({
    this.currencyName,
    this.cotation,
    this.symbol,
    this.imageUrl,
  });

  AddMoeda(nome, cotacao, simbolo, urlImg) {
    Moeda n = new Moeda(
        cotation: cotacao,
        currencyName: nome,
        symbol: simbolo,
        imageUrl: urlImg);
    moedas.add(n);
  }

  List<Moeda> GetListMoedas() {
    return moedas;
  }
}
