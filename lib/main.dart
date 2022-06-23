import 'package:applistamoedas/src/request/ler_json_request.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Moedas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Projeto : Lista de Moedas '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Usuario(context),
          Column(
            children: ListaDeMoedas(context),
          )
        ]),
      ),
    );
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
          horizontal: 30,
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
        horizontal: 30,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Todas as moedas'),
                    Divider(),
                    Text('c0inS-13435-2342-zksh-34556'),
                    Divider(),
                    Text('348,77'),
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
