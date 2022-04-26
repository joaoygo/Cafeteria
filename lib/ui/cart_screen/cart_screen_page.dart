import 'package:cafeteira_ygo/core/common/constants/texts_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/common/themes/app_text_style_theme.dart';
import '../../core/common/themes/colors_theme.dart';
import 'cart_screen_controller.dart';

class CartScreenPage extends GetView<CartScreenController> {
  const CartScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: ColorsTheme.antique.shade900,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 5,
        backgroundColor: Colors.transparent,
        foregroundColor: ColorsTheme.neutral.shade700,
        title: Text(TextsConstants.cart,
            style: AppTextStyleTheme.detailsSelectionTitleAntiqueTextStyle),
      ),
      body: Container(),
    );
  }
}
