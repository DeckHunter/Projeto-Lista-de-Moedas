import 'package:applistamoedas/src/controllers/coins_controller.dart';
import 'package:get/get.dart';
import 'package:applistamoedas/src/controllers/coins_controller.dart';

class TestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoinsController>(() {
      return CoinsController();
    });
  }
}
