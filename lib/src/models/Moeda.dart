import 'package:applistamoedas/src/models/Detalhes.dart';

List<Moeda> moedas = [];

class Moeda {
  String? currencyName;
  String? cotation;
  String? symbol;
  String? imageUrl;
  Detalhes? detalhes;
  Moeda(
      {this.currencyName,
      this.cotation,
      this.symbol,
      this.imageUrl,
      this.detalhes});

  AddMoeda(nome, cotacao, simbolo, urlImg, detalhe) {
    Moeda n = new Moeda(
      cotation: cotacao,
      currencyName: nome,
      symbol: simbolo,
      imageUrl: urlImg,
      detalhes: detalhe,
    );
    moedas.add(n);
  }

  List<Moeda> GetListMoedas() {
    return moedas;
  }
}
