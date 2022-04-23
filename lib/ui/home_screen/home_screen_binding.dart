import 'package:cafeteira_ygo/shared/interfaces/i_home_screen_repository.dart';
import 'package:cafeteira_ygo/shared/repositories/home_screen_repository.dart';
import 'package:cafeteira_ygo/ui/home_screen/home_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHomeScreenRepository>(() => HomeScreenRepository());
    Get.put(HomeScreenController(Get.find()));
  }
}
