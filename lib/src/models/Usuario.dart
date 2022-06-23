import 'package:applistamoedas/src/models/Moeda.dart';

class Usuario {
  String? message;
  String? walletId;
  String? userBalance;
  List<Moeda>? moedas;
  List<Usuario>? usuarios;
  Usuario({this.message, this.walletId, this.userBalance, this.moedas});
}
