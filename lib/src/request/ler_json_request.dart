import 'package:applistamoedas/src/controllers/coins_controller.dart';
import 'package:applistamoedas/src/models/Detalhes.dart';
import 'package:applistamoedas/src/models/Moeda.dart';
import 'package:applistamoedas/src/models/Usuario.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';

class Dados {
  CoinsController coinsController = Get.find();
  Future GetJson() async {
    Uri uri = Uri.http(
      'gitlab.com',
      '/coinswalletbr/coins-flutter-mobile-test/-/raw/main/criptomoedas.json',
    );
    final future = http.get(uri);
    future.then((response) {
      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);
        coinsController.json.value = Map<String, dynamic>.from(jsonData);
      }
    });
  }
}

GetUsuario(json) {
  Usuario usuario = new Usuario(
      message: json['message'],
      userBalance: json['user_balance'],
      walletId: json['wallet_id'],
      moedas: GetCoins(json));
  return usuario;
}

GetDetalhes(c) {
  dynamic detailsJson;
  dynamic details;
  detailsJson = jsonEncode(c['details']);
  details = jsonDecode(detailsJson);
  Detalhes detalhe = new Detalhes(about: details['about'], fee: details['fee']);
  return detalhe;
}

GetCoins(json) {
  dynamic coinsJson = jsonEncode(json['data']);
  dynamic coins = jsonDecode(coinsJson);

  List<Moeda> moedas = [];
  Moeda moeda = new Moeda();

  for (var coin in coins) {
    moeda.AddMoeda(coin['currency_name'], coin['cotation'], coin['symbol'],
        coin['image_url'], GetDetalhes(coin));
  }
  return moeda.GetListMoedas();
}
