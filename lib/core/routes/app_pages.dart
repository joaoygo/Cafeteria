import 'package:cafeteira_ygo/core/routes/app_routes.dart';
import 'package:cafeteira_ygo/ui/cart_screen/cart_screen_binding.dart';
import 'package:cafeteira_ygo/ui/cart_screen/cart_screen_page.dart';
import 'package:cafeteira_ygo/ui/details_selection_screen/details_selection_binding.dart';
import 'package:cafeteira_ygo/ui/details_selection_screen/details_selection_page.dart';
import 'package:cafeteira_ygo/ui/home_screen/home_screen_binding.dart';
import 'package:cafeteira_ygo/ui/home_screen/home_screen_page.dart';
import 'package:cafeteira_ygo/ui/root_page_screen/root_page_screen_binding.dart';
import 'package:cafeteira_ygo/ui/root_page_screen/root_page_screen_page.dart';
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
    GetPage(
      name: AppRoutes.detailsSelectionScreen,
      page: () => const DetailsSelectionPage(),
      binding: DetailsSelectionBinding(),
    ),
    GetPage(
      name: AppRoutes.cartScreen,
      page: () => const CartScreenPage(),
      binding: CartScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.root,
      page: () => const RootPageScreen(),
      binding: RootPageScreenBinding(),
    ),
  ];
}
