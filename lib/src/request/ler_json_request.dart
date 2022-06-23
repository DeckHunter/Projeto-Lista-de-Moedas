import 'package:applistamoedas/src/models/Detalhes.dart';
import 'package:applistamoedas/src/models/Moeda.dart';
import 'package:applistamoedas/src/models/Usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Dados {
  LerJson() {
    Uri uri = Uri.http(
      'gitlab.com',
      '/coinswalletbr/coins-flutter-mobile-test/-/raw/main/criptomoedas.json',
    );
    final future = http.get(uri);
    future.then((response) {
      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);
        return GetUsuario(jsonData);
      } else {
        return 'Error Ao Carregar o Json';
      }
    });
  }

  GetUsuario(json) {
    //Criar Usuario
    Usuario usuario = new Usuario(
        message: json['message'],
        userBalance: json['user_balance'],
        walletId: json['wallet_id'],
        moedas: GetCoins(json));

    /*print(usuario.message);
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
  }*/

    return usuario;
  }

  GetDetalhes(c) {
    dynamic detailsJson;
    dynamic details;
    detailsJson = jsonEncode(c['details']);
    details = jsonDecode(detailsJson);
    Detalhes detalhe =
        new Detalhes(about: details['about'], fee: details['fee']);
    return detalhe;
  }

  GetCoins(json) {
    dynamic coinsJson = jsonEncode(json['data']);
    dynamic coins = jsonDecode(coinsJson);

    List<Moeda> moedas = [];
    Moeda moeda = new Moeda();

    for (var coin in coins) {
      //Criar Moedas
      moeda.AddMoeda(coin['currency_name'], coin['cotation'], coin['symbol'],
          coin['image_url'], GetDetalhes(coin));
    }
    return moeda.GetListMoedas();
  }
}
