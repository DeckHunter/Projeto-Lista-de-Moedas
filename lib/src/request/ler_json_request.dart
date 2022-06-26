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
        //===============================================================
        dynamic jsonData = jsonDecode(response.body);
        coinsController.json.value = Map<String, dynamic>.from(jsonData);

        Usuario usuario = new Usuario(
          message: jsonData['message'],
          userBalance: jsonData['user_balance'],
          walletId: jsonData['wallet_id'],
        );
        coinsController.usuario = usuario;
        //==============================================================
        Moeda moeda = new Moeda();
        Detalhes detalhe = new Detalhes();
        dynamic detailsJson;
        dynamic details;
        dynamic coinsJson = jsonEncode(jsonData['data']);
        dynamic coins = jsonDecode(coinsJson);

        int i = 0;

        for (var coin in coins) {
          i++;
          moeda.AddMoeda(coin['currency_name'], coin['cotation'],
              coin['symbol'], coin['image_url']);

          detailsJson = jsonEncode(coin['details']);
          details = jsonDecode(detailsJson);

          detalhe.AddDetalhe(details['about'], details['fee']);
        }
        coinsController.moedas = moeda.GetListMoedas();
        coinsController.detalhes = detalhe.GetListDetalhes();
        coinsController.tamanho = i;
        //==============================================================
      }
    });
  }
}
