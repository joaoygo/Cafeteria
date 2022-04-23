import 'package:cafeteira_ygo/core/common/constants/assets_constants.dart';
import 'package:cafeteira_ygo/core/common/themes/colors_theme.dart';
import 'package:cafeteira_ygo/ui/splash_screen/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AssetsConstants.backgroundSplashScreenPage,
            alignment: Alignment.center,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: ColorsTheme.antique.shade600.withOpacity(0.95),
            ),
          ),
          Positioned.fill(
            left: MediaQuery.of(context).size.width * 0.35,
            right: MediaQuery.of(context).size.width * 0.35,
            child: SvgPicture.asset(
              AssetsConstants.logoCoffeSplashScreenPage,
            ),
          )
        ],
      ),
    );
  }
}
