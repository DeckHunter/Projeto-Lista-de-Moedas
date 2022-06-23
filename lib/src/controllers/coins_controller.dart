import 'package:applistamoedas/src/models/Usuario.dart';
import 'package:applistamoedas/src/request/ler_json_request.dart';
import 'package:get/get.dart';

class CoinsCrontroller extends GetxController {
  Usuario usuario = Dados().LerJson();
}
