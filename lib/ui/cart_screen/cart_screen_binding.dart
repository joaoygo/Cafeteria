import 'package:cafeteira_ygo/shared/interfaces/i_cart_screen_repository.dart';
import 'package:cafeteira_ygo/shared/repositories/cart_screen_repository.dart';
import 'package:cafeteira_ygo/ui/cart_screen/cart_screen_controller.dart';
import 'package:get/get.dart';

class CartScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICartScreenRepository>(() => CartScreenRepository());
    Get.put(CartScreenController(Get.find()));
  }
}
