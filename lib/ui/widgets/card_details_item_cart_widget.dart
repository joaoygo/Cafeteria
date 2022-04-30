import 'package:cafeteira_ygo/core/common/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:cafeteira_ygo/core/common/constants/texts_constants.dart';
import 'package:cafeteira_ygo/ui/widgets/total_items_widget.dart';
import 'package:get/get.dart';

import '../../core/common/themes/app_text_style_theme.dart';

class CardDetailsItemCartWidget extends StatelessWidget {
  final int amount;
  final String size;
  final String nome;
  final int amoutSugar;
  final double price;
  const CardDetailsItemCartWidget({
    Key? key,
    required this.amount,
    required this.size,
    required this.nome,
    required this.amoutSugar,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Center(
                    child: SvgPicture.asset(
                      '${AssetsConstants.baseAssets}${nome.toLowerCase()}.svg',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nome,
                        style: AppTextStyleTheme
                            .cardDetailsItemTitleWidgetTextStyle,
                      ),
                      Row(
                        children: [
                          Text('${size.toUpperCase()} ',
                              style: AppTextStyleTheme
                                  .cardDetailsItemSubTitleSpanWidgetTextStyle),
                          Text(
                            TextsConstants.size,
                            style: AppTextStyleTheme
                                .cardDetailsItemSubTitleWidgetTextStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                TotalItemsWidget(
                  value: amount,
                  incremente: () =>
                      Get.snackbar('Em construçao', 'Em construçao'),
                  decremente: () =>
                      Get.snackbar('Em construçao', 'Em construçao'),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\$',
                      style: AppTextStyleTheme
                          .detailsSelectionPriceItemSpanTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        price.toStringAsFixed(2),
                        style: AppTextStyleTheme
                            .cardDetailsPriceItemWidgetTextStyle,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
