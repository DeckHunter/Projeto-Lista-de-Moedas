import 'package:applistamoedas/src/models/Detalhes.dart';

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

  Moeda.fromJson(Map<String, dynamic> json) {
    currencyName = json['currency_name'];
    cotation = json['cotation'];
    symbol = json['symbol'];
    imageUrl = json['image_url'];
    detalhes = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency_name'] = this.currencyName;
    data['cotation'] = this.cotation;
    data['symbol'] = this.symbol;
    data['image_url'] = this.imageUrl;
    data['details'] = this.detalhes;
    return data;
  }
}
