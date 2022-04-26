import 'package:cafeteira_ygo/core/common/constants/layout_constants.dart';
import 'package:cafeteira_ygo/core/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  onInit() async {
    super.onInit();
    await splashScreenDelay();
  }

  Future<void> splashScreenDelay() async {
    await Future.delayed(
      const Duration(seconds: LayoutConstants.durationSplashScreenPage),
      () async {
        await Get.offAllNamed(AppRoutes.root, arguments: 0);
      },
    );
  }
}
