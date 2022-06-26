import 'package:applistamoedas/src/models/Detalhes.dart';
import 'package:applistamoedas/src/models/Moeda.dart';
import 'package:applistamoedas/src/models/Usuario.dart';
import 'package:applistamoedas/src/request/ler_json_request.dart';
import 'package:get/get.dart';

class CoinsController extends GetxController {
  RxMap<String, dynamic> json = RxMap<String, dynamic>();
  RxMap<String, dynamic> coins = RxMap<String, dynamic>();
  RxMap<String, dynamic> detalhe = RxMap<String, dynamic>();

  Usuario usuario = Usuario();
  List<Moeda> moedas = [];
  List<Detalhes> detalhes = [];
  int tamanho = 0;

  GetUser() {
    print(usuario.message);
    print(usuario.userBalance);
    print(usuario.walletId);
  }

  GetCoin() {
    for (var m in moedas) {
      print(m.cotation);
      print(m.imageUrl);
      print(m.currencyName);
      print(m.symbol);
    }
  }

  GetDetalhes() {
    for (var d in detalhes) {
      print(d.about);
      print(d.fee);
    }
  }

  GetTamanho() {
    print('Tamanho : ' + tamanho.toString());
    return tamanho;
  }
}
