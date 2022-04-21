import 'package:cafeteira_ygo/shared/interfaces/i_home_screen_repository.dart';
import 'package:cafeteira_ygo/shared/repositories/home_screen_repository.dart';
import 'package:cafeteira_ygo/ui/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHomeScreenRepository>(() => HomeScreenRepository());
    Get.put(SplashScreenController());
  }
}
