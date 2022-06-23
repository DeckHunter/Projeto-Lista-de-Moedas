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

List<Widget> ListaDeMoedas() {
  List<Widget> coins = [];
  for (int i = 0; i != 8; i++) {
    var coin = InkWell(
      onTap: () {
        //Get.toNamed('/editarAtividade');
      },
      child: Container(
        padding: const EdgeInsets.only(left: 12.0),
        margin: const EdgeInsets.symmetric(
          horizontal: 2,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.amber,
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
            color: Colors.red,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Moeda'),
                      Divider(),
                      Text('Descrição'),
                    ],
                  ),
                ),
                Card(
                  color: Colors.amber,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.edit),
                  ),
                ),
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
