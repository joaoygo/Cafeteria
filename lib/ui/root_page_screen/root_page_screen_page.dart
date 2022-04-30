import 'package:cafeteira_ygo/core/common/constants/assets_constants.dart';
import 'package:cafeteira_ygo/core/common/themes/colors_theme.dart';
import 'package:cafeteira_ygo/ui/root_page_screen/root_page_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RootPageScreen extends GetView<RootPageScreenController> {
  const RootPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );
    return Obx(() => Scaffold(
          body: SafeArea(
            child: controller.bodyContent.elementAt(controller.selectedIndex),
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: ColorsTheme.antique.shade700,
              unselectedItemColor: ColorsTheme.antique.shade600,
              backgroundColor: ColorsTheme.neutral.shade100,
              currentIndex: controller.selectedIndex,
              onTap: (index) => controller.selectedIndex = index,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.home,
                    size: 36,
                  ),
                  label: "",
                  activeIcon: Icon(
                    Icons.home,
                    size: 36,
                    color: ColorsTheme.antique.shade700,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetsConstants.cupIcon,
                    width: 36,
                    color: ColorsTheme.antique.shade600,
                  ),
                  label: "",
                  activeIcon: SvgPicture.asset(
                    AssetsConstants.cupIcon,
                    width: 36,
                    color: ColorsTheme.antique.shade700,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline,
                    size: 36,
                    color: ColorsTheme.antique.shade600,
                  ),
                  label: "",
                  activeIcon: Icon(
                    Icons.person_outline,
                    size: 36,
                    color: ColorsTheme.antique.shade700,
                  ),
                ),
              ],
              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
          ),
        ));
  }
}
