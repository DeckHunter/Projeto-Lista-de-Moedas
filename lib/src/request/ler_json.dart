import 'package:applistamoedas/src/models/Detalhes.dart';
import 'package:applistamoedas/src/models/Moeda.dart';
import 'package:applistamoedas/src/models/Usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

TrabalhandoJson() {
  Uri uri = Uri.http(
    'gitlab.com',
    '/coinswalletbr/coins-flutter-mobile-test/-/raw/main/criptomoedas.json',
  );
  final future = http.get(uri);

  future.then((response) {
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final coinsJson = jsonEncode(jsonData['data']);
      final coins = jsonDecode(coinsJson);
      dynamic detailsJson;
      dynamic details;

      List<Moeda> moedas = [];
      Moeda moeda = new Moeda();

      print('');

      for (var coin in coins) {
        detailsJson = jsonEncode(coin['details']);
        details = jsonDecode(detailsJson);
        //Criar Detalhes
        Detalhes detalhe =
            new Detalhes(about: details['about'], fee: details['fee']);
        //Criar Moedas
        moeda.AddMoeda(coin['currency_name'], coin['cotation'], coin['symbol'],
            coin['image_url'], detalhe);
      }
      //Criar Usuario
      Usuario usuario = new Usuario(
          message: jsonData['message'],
          userBalance: jsonData['user_balance'],
          walletId: jsonData['wallet_id'],
          moedas: moeda.GetListMoedas());

      print(usuario.message);
      print(usuario.userBalance);
      print(usuario.walletId);

      List<Moeda> m = usuario.moedas as List<Moeda>;
      for (var item in m) {
        print('====================================================');
        print(item.currencyName);
        print(item.cotation);
        print(item.imageUrl);
        print(item.symbol);
        Detalhes d = item.detalhes as Detalhes;
        print(d.about);
        print(d.fee);
        print('====================================================');
      }
    } else {
      print('Error Ao Carregar o Json');
    }
  });
}
