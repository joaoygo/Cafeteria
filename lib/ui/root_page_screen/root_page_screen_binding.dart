import 'package:cafeteira_ygo/shared/interfaces/i_cart_screen_repository.dart';
import 'package:cafeteira_ygo/shared/interfaces/i_home_screen_repository.dart';
import 'package:cafeteira_ygo/shared/repositories/cart_screen_repository.dart';
import 'package:cafeteira_ygo/shared/repositories/home_screen_repository.dart';
import 'package:cafeteira_ygo/ui/cart_screen/cart_screen_controller.dart';
import 'package:cafeteira_ygo/ui/home_screen/home_screen_controller.dart';
import 'package:cafeteira_ygo/ui/root_page_screen/root_page_screen_controller.dart';
import 'package:get/get.dart';

class RootPageScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RootPageScreenController());
    Get.lazyPut<IHomeScreenRepository>(() => HomeScreenRepository());
    Get.put(HomeScreenController(Get.find()));
    Get.lazyPut<ICartScreenRepository>(() => CartScreenRepository());
    Get.put(CartScreenController(Get.find()));
  }
}
