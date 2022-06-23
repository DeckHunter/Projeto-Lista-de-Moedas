import 'package:applistamoedas/src/utils/format_money.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCoins extends StatefulWidget {
  const HomeCoins({Key? key}) : super(key: key);

  @override
  State<HomeCoins> createState() => _HomeCoinsState();
}

class _HomeCoinsState extends State<HomeCoins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

List<Widget> ListaDeMoedas(context) {
  List<Widget> coins = [];
  for (int i = 0; i != 8; i++) {
    var coin = InkWell(
      onTap: () {
        //Get.toNamed('/editarAtividade');
      },
      child: Container(
        padding: const EdgeInsets.only(left: 12.0),
        margin: const EdgeInsets.symmetric(
          horizontal: 40,
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
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Avalanche'),
                      Divider(),
                      Text('R 348,77'),
                    ],
                  ),
                ),
                Image.network(
                  'https://panda-crypto-images.s3.amazonaws.com/avax.png',
                  width: MediaQuery.of(context).size.width * 0.12,
                  height: MediaQuery.of(context).size.height * 0.12,
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

Widget Usuario(context) {
  var coin = InkWell(
    onTap: () {
      //Get.toNamed('/editarAtividade');
    },
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
                      'Todas as moedas',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Divider(),
                    Text(
                      'c0inS-13435-2342-zksh-34556',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Divider(),
                    Text(
                      new Transaction(348.77).getCurrency().toString(),
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
