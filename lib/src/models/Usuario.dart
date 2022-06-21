import 'package:applistamoedas/src/models/Moeda.dart';

class Usuario {
  String? message;
  String? walletId;
  String? userBalance;
  List<Moeda>? moedas;
  Usuario({this.message, this.walletId, this.userBalance, this.moedas});

  Usuario.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    walletId = json['wallet_id'];
    userBalance = json['user_balance'];
    moedas = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['wallet_id'] = this.walletId;
    data['user_balance'] = this.userBalance;
    data['data'] = this.moedas;
    return data;
  }
}
