import 'package:cafeteira_ygo/core/routes/app_routes.dart';
import 'package:cafeteira_ygo/ui/home_screen/home_screen_binding.dart';
import 'package:cafeteira_ygo/ui/home_screen/home_screen_page.dart';
import 'package:cafeteira_ygo/ui/splash_screen/splash_screen_binding.dart';
import 'package:cafeteira_ygo/ui/splash_screen/splash_screen_page.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreenPage(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreenPage(),
      binding: HomeScreenBinding(),
    ),
  ];
}
