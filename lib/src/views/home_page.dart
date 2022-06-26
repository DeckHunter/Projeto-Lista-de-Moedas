import 'dart:convert';
import 'dart:developer';

import 'package:applistamoedas/src/controllers/coins_controller.dart';
import 'package:applistamoedas/src/models/Detalhes.dart';
import 'package:applistamoedas/src/models/Moeda.dart';
import 'package:applistamoedas/src/models/Usuario.dart';
import 'package:applistamoedas/src/request/ler_json_request.dart';
import 'package:applistamoedas/src/utils/format_money.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Dados().GetJson();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                return Column(
                  children: [
                    BarraUsuario(context),
                    Column(
                      children: ListaDeMoedas(context),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> ListaDeMoedas(context) {
    List<Widget> coins = [];
    Dados().GetJson();
    CoinsController coinsController = Get.find();
    print(coinsController.json);
    for (int i = 0; i < coinsController.tamanho; i++) {
      var coin = InkWell(
        onTap: () {
          ShowAlertDialog(context, coinsController.detalhes[i].fee.toString(),
              coinsController.detalhes[i].about.toString());
        },
        child: Container(
          padding: const EdgeInsets.only(left: 12.0),
          margin: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blueAccent,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(IsZero(coinsController.tamanho)
                            ? coinsController.moedas[i].currencyName.toString()
                            : 'Carregando...'),
                        Divider(),
                        Text(IsZero(coinsController.tamanho)
                            ? Transaction(double.parse(coinsController
                                    .moedas[i].cotation as String))
                                .getCurrency()
                                .toString()
                            : 'Carregando...'),
                      ],
                    ),
                  ),
                  Text(
                    IsZero(coinsController.tamanho)
                        ? coinsController.moedas[i].symbol.toString()
                        : 'Carregando...',
                  )
                ],
              ),
            ),
          ),
        ),
      );
      coins.add(coin);
    }
    return coins;
  }

  Widget BarraUsuario(context) {
    Dados().GetJson();
    CoinsController coinsController = Get.find();
    var coin = InkWell(
      child: Container(
        padding: const EdgeInsets.only(left: 12.0),
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.blueAccent,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        IsEmpty(coinsController.usuario.message)
                            ? coinsController.usuario.message.toString()
                            : 'Carregando...',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Divider(),
                      Text(
                        IsEmpty(coinsController.usuario.walletId)
                            ? coinsController.usuario.walletId.toString()
                            : 'Carregando...',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Divider(),
                      Text(
                        IsEmpty(coinsController.usuario.userBalance)
                            ? Transaction(double.parse(coinsController
                                    .usuario.userBalance as String))
                                .getCurrency()
                                .toString()
                            : 'Carregando...',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    return coin;
  }

  bool IsEmpty(x) {
    if (x == null) {
      return false;
    } else {
      return true;
    }
  }

  bool IsZero(x) {
    if (x == 0) {
      return false;
    } else {
      return true;
    }
  }

  Future<dynamic> ShowAlertDialog(
      BuildContext context, String datalhesC, String fee) async {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(
                fee,
                textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Taxa : ' + datalhesC,
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Ok",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueAccent),
                      alignment: Alignment.center,
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(10)),
                    ),
                  )
                ],
              ),
            ));
  }
}
