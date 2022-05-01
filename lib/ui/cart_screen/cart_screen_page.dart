import 'package:cafeteira_ygo/core/common/constants/texts_constants.dart';
import 'package:cafeteira_ygo/shared/models/item_model.dart';
import 'package:cafeteira_ygo/ui/widgets/card_details_item_cart_widget.dart';
import 'package:cafeteira_ygo/ui/widgets/floating_button_primary_widget.dart';
import 'package:cafeteira_ygo/ui/widgets/floating_button_round_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/common/constants/assets_constants.dart';
import '../../core/common/themes/app_text_style_theme.dart';
import '../../core/common/themes/colors_theme.dart';
import 'cart_screen_controller.dart';

class CartScreenPage extends GetView<CartScreenController> {
  const CartScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: ColorsTheme.neutral.shade700,
        title: Text(TextsConstants.cart,
            style: AppTextStyleTheme.detailsSelectionTitleAntiqueTextStyle),
      ),
      body: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: SvgPicture.asset(
                      AssetsConstants.backgroundSplashScreenPage,
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.15,
                    color: ColorsTheme.antique.shade600.withOpacity(0.95),
                  ),
                ],
              ),
              Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      //shrinkWrap: true,
                      itemCount: controller.newItems.length,
                      itemBuilder: (_, index) {
                        final ItemModel item = controller.newItems[index];
                        return CardDetailsItemCartWidget(
                          nome: item.name,
                          size: item.size,
                          amount: item.amount,
                          amoutSugar: item.cube,
                          price: item.price,
                          increment: () => controller.increment(index),
                          decrement: () => controller.decrement(index),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      TextsConstants.total,
                      style: AppTextStyleTheme
                          .cardScreenPageLineFooterTextWidgetTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 2,
                        color: ColorsTheme.neutral.shade700,
                      ),
                    ),
                    Text(
                      '\$ ${controller.priceTotal.toStringAsFixed(2)}',
                      style: AppTextStyleTheme
                          .cardScreenPageLineFooterTextWidgetTextStyle,
                    )
                  ],
                ),
              ),
            ],
          )),
      bottomSheet: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingButtonPrimaryWidget(
              onPressed: () => Get.defaultDialog(
                title: 'Thanks',
                titlePadding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.04),
                content: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.035),
                        child: const Text('Have a good coffee'),
                      ),
                      SvgPicture.asset(
                        AssetsConstants.logoCoffeSplashScreenPage,
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.035),
                        child: FloatingButtonPrimaryWidget(
                          onPressed: () => print('object'),
                          label: 'OK',
                        ),
                      )
                    ],
                  ),
                ),
              ),
              label: TextsConstants.finish,
            ),
            FloatingButtonRoundWidget(
                onPressed: () => Get.snackbar('Em construçao', 'Em construçao'),
                icon: Icon(Icons.cancel_outlined),
                label: TextsConstants.viewCart,
                color: ColorsTheme.antique.shade700),
            // FloatingActionButton(
            //   heroTag: TextsConstants.viewCart,
            //   child: const Icon(Icons.cancel_outlined),
            //   onPressed: () => Get.snackbar('Em construçao', 'Em construçao'),
            //   backgroundColor: ColorsTheme.antique.shade700,
            // ),
          ],
        ),
      ),
    );
  }
}
