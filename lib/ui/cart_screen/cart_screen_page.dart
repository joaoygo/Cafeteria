import 'package:cafeteira_ygo/core/common/constants/texts_constants.dart';
import 'package:cafeteira_ygo/shared/models/item_model.dart';
import 'package:cafeteira_ygo/ui/widgets/card_details_item_cart_widget.dart';
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: ColorsTheme.antique.shade900,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: ColorsTheme.neutral.shade700,
        title: Text(TextsConstants.cart,
            style: AppTextStyleTheme.detailsSelectionTitleAntiqueTextStyle),
      ),
      body: controller.obx(
        (state) {
          return Column(
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
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    //shrinkWrap: true,
                    itemCount: state.length,
                    itemBuilder: (_, index) {
                      final ItemModel item = state[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.03,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1),
                        child: CardDetailsItemCartWidget(
                          nome: item.name,
                          size: item.size,
                          amount: item.amount,
                          amoutSugar: item.cube,
                        ),
                      );
                    },
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
                      '\$ 1,30',
                      style: AppTextStyleTheme
                          .cardScreenPageLineFooterTextWidgetTextStyle,
                    )
                  ],
                ),
              ),
            ],
          );
        },
        onError: (error) {
          return Center(child: Text(error.toString()));
        },
      ),
      bottomSheet: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton.extended(
              heroTag: TextsConstants.addCart,
              label: const Text(TextsConstants.finish),
              onPressed: () => print('aaa'),
              backgroundColor: ColorsTheme.antique.shade700,
              extendedPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.2),
            ),
            FloatingActionButton(
              heroTag: TextsConstants.viewCart,
              child: const Icon(Icons.cancel_outlined),
              onPressed: () => print('bbbbb'),
              backgroundColor: ColorsTheme.antique.shade700,
            ),
          ],
        ),
      ),
    );
  }
}
