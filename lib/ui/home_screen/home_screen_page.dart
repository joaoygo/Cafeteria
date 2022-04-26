import 'package:cafeteira_ygo/core/common/constants/texts_constants.dart';
import 'package:cafeteira_ygo/core/common/themes/app_text_style_theme.dart';
import 'package:cafeteira_ygo/core/common/themes/colors_theme.dart';
import 'package:cafeteira_ygo/shared/models/item_model.dart';
import 'package:cafeteira_ygo/ui/home_screen/home_screen_controller.dart';
import 'package:cafeteira_ygo/ui/widgets/card_with_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenPage extends GetView<HomeScreenController> {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.antique.shade600,
      body: controller.obx((state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 70.0,
                right: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      controller: controller.inputSearchItemController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    child: Icon(
                      Icons.search,
                      color: ColorsTheme.neutral.shade700,
                    ),
                    onPressed: () => controller.inputSearchItem(),
                    backgroundColor: Colors.transparent,
                    autofocus: false,
                    elevation: 0,
                  )
                ],
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 36),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: TextsConstants.itsgreat,
                        style: AppTextStyleTheme.homeScreenTitleBlackTextStyle,
                      ),
                      TextSpan(
                        text: TextsConstants.dayCoffee,
                        style:
                            AppTextStyleTheme.homeScreenTitleAntiqueTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: state.length,
                itemBuilder: (_, index) {
                  final ItemModel item = state[index];
                  return CardWithItemWidget(
                    label: item.name,
                    onPressed: () => controller.goToDetails(item),
                  );
                },
              ),
            ),
          ],
        );
      }, onError: (error) {
        return Center(
          child: Text(error.toString()),
        );
      }),
    );
  }
}
