import 'package:cafeteira_ygo/core/common/constants/texts_constants.dart';
import 'package:cafeteira_ygo/shared/interfaces/i_details_selection_screen_repository.dart';
import 'package:cafeteira_ygo/shared/models/item_model.dart';
import 'package:get/get.dart';

import '../../core/routes/app_routes.dart';
import '../cart_screen/cart_screen_controller.dart';

class DetailsSelectionController extends GetxController with StateMixin {
  ItemModel finalItem = ItemModel.init();
  RxString currentSize = ''.obs;
  RxInt currentSugar = 0.obs;
  RxInt amountItems = 0.obs;
  RxDouble basePriceNow = 0.0.obs;
  RxDouble basePrice = 0.0.obs;
  // RxDouble unitaryPrice = 0.0.obs;
  // RxDouble valueItemSugar = 0.0.obs;
  // RxDouble valueItemSize = 0.0.obs;

  final IDetailsSelectionScreenRepository _iDetailsSelectionScreenRepository;
  DetailsSelectionController(
    this._iDetailsSelectionScreenRepository,
  );
  @override
  void onInit() {
    super.onInit();
    finalItem = Get.arguments;
    currentSize.value = finalItem.size;
    currentSugar.value = finalItem.cube;
    basePrice.value = finalItem.price;
    amountItems.value = 1;
    change([], status: RxStatus.success());
  }

  void goToDetails(ItemModel item) async {
    change([], status: RxStatus.loading());
    try {
      _iDetailsSelectionScreenRepository.postItems(item);
      change([], status: RxStatus.success());
    } catch (e) {
      change([],
          status: RxStatus.error(TextsConstants.errorWhenAddingItemToCart));
    }
  }

  void changeSize(String newSize) {
    currentSize.value = newSize;
    if (newSize == 's') {
      basePrice.value = finalItem.price + 1.50;
    } else if (newSize == 'm') {
      basePrice.value = finalItem.price + 2;
    } else if (newSize == 'l') {
      basePrice.value = finalItem.price + 2.50;
    }
  }

  void changeAmountSugar(int newAmountCubesSugar) {
    if (newAmountCubesSugar == 1 && currentSugar.value != newAmountCubesSugar) {
      //changeSize(currentSize.value);
      basePrice.value = basePrice.value + 0.50;
      currentSugar.value = newAmountCubesSugar;
    } else if (newAmountCubesSugar == 2 &&
        currentSugar.value != newAmountCubesSugar) {
      changeSize(currentSize.value);
      basePrice.value = basePrice.value + 1;
      currentSugar.value = newAmountCubesSugar;
    } else if (newAmountCubesSugar == 3 &&
        currentSugar.value != newAmountCubesSugar) {
      changeSize(currentSize.value);
      basePrice.value = basePrice.value + 1.5;
      currentSugar.value = newAmountCubesSugar;
    } else if (newAmountCubesSugar == 0) {
      currentSugar.value = newAmountCubesSugar;
      changeSize(currentSize.value);
    }
  }

  // void calculateUnitaryPrice() {
  //   basePrice.value =
  //       (valueItemSugar.value + valueItemSize.value) - valueItemSize.value;
  // }

  void decrement() {
    if (amountItems.value == 2) {
      changeAmountSugar(currentSugar.value);
      amountItems.value = 1;
    } else if (amountItems.value == 1) {
      amountItems.value = 1;
    } else {
      amountItems.value = amountItems.value - 1;
      basePrice.value = basePrice.value - (basePrice.value / amountItems.value);
    }
  }

  void increment() {
    if (basePriceNow.value != basePrice.value) {
      currentSize.value = 's';
      currentSugar.value = 0;
      amountItems.value = 1;
      basePrice.value = 0.0;
    } else {
      basePrice = (basePrice.value * amountItems.value) as RxDouble;
    }
    // var uniValue = basePrice.value / amountItems.value;
    // amountItems.value = amountItems.value + 1;
    // basePrice.value = uniValue * amountItems.value;
    // print(amountItems);
  }

  void show() {
    finalItem.size = currentSize.value;
    finalItem.cube = currentSugar.value;
    finalItem.amount = amountItems.value;
    finalItem.price =
        ((basePrice.value * amountItems.value) + (currentSugar.value * 0.50));

    change([], status: RxStatus.loading());
    try {
      _iDetailsSelectionScreenRepository.postItems(finalItem);
      change([], status: RxStatus.success());
    } catch (e) {
      change([],
          status: RxStatus.error(TextsConstants.errorWhenAddingItemToCart));
    }
  }

  void goToCar() async {
    CartScreenController cartScreenController = Get.find();
    await cartScreenController.findItemsCart();
    Get.toNamed(
      AppRoutes.cartScreen,
    );
  }
}
