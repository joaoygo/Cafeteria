import 'package:cafeteira_ygo/core/common/themes/colors_theme.dart';
import 'package:cafeteira_ygo/ui/cart_screen/cart_screen_page.dart';
import 'package:cafeteira_ygo/ui/home_screen/home_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPageScreenController extends GetxController {
  final _selectedIndex = 0.obs;
  final _bodyContent = <Widget>[].obs;
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(index) => _selectedIndex.value = index;

  get bodyContent => _bodyContent;
  set bodyContent(value) => _bodyContent.value = value;

  void changeTabIndex(int index) => selectedIndex = index;

  @override
  void onInit() {
    changeTabIndex(Get.arguments);
    bodyContent.value = <Widget>[
      const HomeScreenPage(),
      const CartScreenPage(),
      Container(
        color: ColorsTheme.antique.shade600,
        child: const Center(
          child: Text('Em contrrução'),
        ),
      )
    ];
    super.onInit();
  }
}
