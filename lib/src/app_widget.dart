import 'package:applistamoedas/src/bindings/test_bindings.dart';
import 'package:applistamoedas/src/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista De Moedas',
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeCoins(),
          binding: TestBinding(),
        ),
      ],
    );
  }
}
