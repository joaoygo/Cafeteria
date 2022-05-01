import 'package:cafeteira_ygo/core/common/constants/assets_constants.dart';
import 'package:cafeteira_ygo/core/common/constants/texts_constants.dart';
import 'package:cafeteira_ygo/core/common/themes/app_text_style_theme.dart';
import 'package:cafeteira_ygo/core/common/themes/colors_theme.dart';
import 'package:cafeteira_ygo/ui/details_selection_screen/details_selection_controller.dart';
import 'package:cafeteira_ygo/ui/widgets/change_size_coffe.dart';
import 'package:cafeteira_ygo/ui/widgets/filled_square_widget.dart';
import 'package:cafeteira_ygo/ui/widgets/square_with_line_outlined_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/total_items_widget.dart';

class DetailsSelectionPage extends GetView<DetailsSelectionController> {
  const DetailsSelectionPage({Key? key}) : super(key: key);

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
        title: Text(controller.finalItem.name,
            style: AppTextStyleTheme.detailsSelectionTitleAntiqueTextStyle),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: SvgPicture.asset(
                      AssetsConstants.backgroundSplashScreenPage,
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    color: ColorsTheme.antique.shade600.withOpacity(0.95),
                  ),
                  Positioned.fill(
                    bottom: MediaQuery.of(context).size.height * 0.1,
                    top: MediaQuery.of(context).size.height * 0.15,
                    child: SvgPicture.asset(
                      AssetsConstants.macciato,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03,
                            left: MediaQuery.of(context).size.height * 0.03),
                        child: Text(
                          controller.finalItem.name,
                          style: AppTextStyleTheme
                              .detailsSelectionSubtitleItemsBlackTextStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01,
                            left: MediaQuery.of(context).size.height * 0.03),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$',
                              style: AppTextStyleTheme
                                  .detailsSelectionPriceItemSpanTextStyle,
                            ),
                            Text(
                              controller.priceFinal.value.toStringAsFixed(2),
                              style: AppTextStyleTheme
                                  .detailsSelectionPriceItemTextStyle,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.height * 0.03),
                    child: TotalItemsWidget(
                      value: controller.amountItems.value,
                      incremente: () => controller.increment(),
                      decremente: () => controller.decrement(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04,
                  left: MediaQuery.of(context).size.height * 0.03,
                ),
                child: Text(TextsConstants.size,
                    style: AppTextStyleTheme
                        .detailsSelectionSubtitleItemsBlackTextStyle),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01,
                    horizontal: MediaQuery.of(context).size.height * 0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    controller.currentSize.value == 's'
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: ChangeSizeCoffe(
                              avatar: controller.finalItem.avatar,
                              onPressed: () => controller.changeSize('s'),
                              outlined: false,
                              sizeIcon:
                                  MediaQuery.of(context).size.height * 0.03,
                            ),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: ChangeSizeCoffe(
                              avatar: controller.finalItem.avatar,
                              onPressed: () => controller.changeSize('s'),
                              outlined: true,
                              sizeIcon:
                                  MediaQuery.of(context).size.height * 0.03,
                            ),
                          ),
                    controller.currentSize.value == 'm'
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: ChangeSizeCoffe(
                              avatar: controller.finalItem.avatar,
                              onPressed: () => controller.changeSize('m'),
                              sizeIcon:
                                  MediaQuery.of(context).size.height * 0.045,
                              outlined: false,
                            ),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: ChangeSizeCoffe(
                              avatar: controller.finalItem.avatar,
                              onPressed: () => controller.changeSize('m'),
                              sizeIcon:
                                  MediaQuery.of(context).size.height * 0.045,
                              outlined: true,
                            ),
                          ),
                    controller.currentSize.value == 'l'
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: ChangeSizeCoffe(
                              avatar: controller.finalItem.avatar,
                              onPressed: () => controller.changeSize('l'),
                              sizeIcon:
                                  MediaQuery.of(context).size.height * 0.06,
                              outlined: false,
                            ),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: ChangeSizeCoffe(
                              avatar: controller.finalItem.avatar,
                              onPressed: () => controller.changeSize('l'),
                              sizeIcon:
                                  MediaQuery.of(context).size.height * 0.06,
                              outlined: true,
                            ),
                          )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.height * 0.03,
                    bottom: MediaQuery.of(context).size.height * 0.01),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${TextsConstants.sugar} ',
                        style: AppTextStyleTheme
                            .detailsSelectionSubtitleItemsBlackTextStyle,
                      ),
                      TextSpan(
                        text: TextsConstants.inCubes,
                        style: AppTextStyleTheme
                            .detailsSelectionSubtitleItemsSpanBlackTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.03),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.height * 0.05),
                      child: controller.currentSugar.value == 0
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SquareWithLineOutlinedWidget(
                                  color: ColorsTheme.neutral,
                                  onPressed: () =>
                                      controller.changeAmountSugar(0),
                                  isSelect: true,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.01),
                                  child: Container(
                                    width: MediaQuery.of(context).size.height *
                                        0.02,
                                    height: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsTheme.antique.shade700,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SquareWithLineOutlinedWidget(
                                  color: ColorsTheme.antique,
                                  onPressed: () =>
                                      controller.changeAmountSugar(0),
                                  isSelect: false,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.01),
                                  child: Container(
                                    width: MediaQuery.of(context).size.height *
                                        0.02,
                                    height: 2,
                                    decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.height * 0.04),
                      child: controller.currentSugar.value == 1
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FilledSquareWidget(
                                  onPressed: () =>
                                      controller.changeAmountSugar(1),
                                  outlined: false,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.01),
                                  child: Container(
                                    width: MediaQuery.of(context).size.height *
                                        0.02,
                                    height: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsTheme.antique.shade700,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                FilledSquareWidget(
                                  onPressed: () =>
                                      controller.changeAmountSugar(1),
                                  outlined: true,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.01),
                                  child: Container(
                                    width: MediaQuery.of(context).size.height *
                                        0.02,
                                    height: 2,
                                    decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.01,
                          right: MediaQuery.of(context).size.height * 0.05),
                      child: controller.currentSugar.value == 2
                          ? Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      child: FilledSquareWidget(
                                        onPressed: () =>
                                            controller.changeAmountSugar(2),
                                        outlined: false,
                                      ),
                                    ),
                                    FilledSquareWidget(
                                      onPressed: () =>
                                          controller.changeAmountSugar(2),
                                      outlined: false,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.01),
                                  child: Container(
                                    width: MediaQuery.of(context).size.height *
                                        0.02,
                                    height: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsTheme.antique.shade700,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      child: FilledSquareWidget(
                                          onPressed: () =>
                                              controller.changeAmountSugar(2),
                                          outlined: true),
                                    ),
                                    FilledSquareWidget(
                                        onPressed: () =>
                                            controller.changeAmountSugar(2),
                                        outlined: true),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.01),
                                  child: Container(
                                    width: MediaQuery.of(context).size.height *
                                        0.02,
                                    height: 2,
                                    decoration: const BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    controller.currentSugar.value == 3
                        ? Column(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    child: FilledSquareWidget(
                                      onPressed: () =>
                                          controller.changeAmountSugar(3),
                                      outlined: false,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        child: FilledSquareWidget(
                                          onPressed: () =>
                                              controller.changeAmountSugar(3),
                                          outlined: false,
                                        ),
                                      ),
                                      FilledSquareWidget(
                                        onPressed: () =>
                                            controller.changeAmountSugar(3),
                                        outlined: false,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.height * 0.02,
                                  height: 2,
                                  decoration: BoxDecoration(
                                      color: ColorsTheme.antique.shade700,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    child: FilledSquareWidget(
                                        onPressed: () =>
                                            controller.changeAmountSugar(3),
                                        outlined: true),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        child: FilledSquareWidget(
                                            onPressed: () =>
                                                controller.changeAmountSugar(3),
                                            outlined: true),
                                      ),
                                      FilledSquareWidget(
                                          onPressed: () =>
                                              controller.changeAmountSugar(3),
                                          outlined: true),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.height * 0.02,
                                  height: 2,
                                  decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
        child: controller.obx((state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton.extended(
                heroTag: TextsConstants.addCart,
                label: const Text(TextsConstants.addCart),
                onPressed: () => controller.addItemCart(),
                backgroundColor: ColorsTheme.antique.shade700,
                extendedPadding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.2),
              ),
              FloatingActionButton(
                heroTag: TextsConstants.viewCart,
                child: const Icon(Icons.shopping_cart_outlined),
                onPressed: () => controller.goToCar(),
                backgroundColor: ColorsTheme.antique.shade700,
              ),
            ],
          );
        }),
      ),
    );
  }
}
