import 'package:cafeteira_ygo/core/common/constants/texts_constants.dart';
import 'package:cafeteira_ygo/shared/interfaces/i_details_selection_screen_repository.dart';
import 'package:cafeteira_ygo/shared/models/item_model.dart';
import 'package:get/get.dart';

import '../../core/routes/app_routes.dart';

class DetailsSelectionController extends GetxController with StateMixin {
  ItemModel finalItem = ItemModel.init();
  RxString currentSize = ''.obs;
  RxInt currentSugar = 0.obs;
  RxInt amountItems = 0.obs;

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
    //unitaryPrice.value = finalItem.price;
    basePrice.value = finalItem.price;
    amountItems.value = 1;
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

    // Get.toNamed(
    //   AppRoutes.detailsSelectionScreen,
    //   arguments: item,
    // );
  }

  void changeSize(String newSize) {
    currentSize.value = newSize;
    if (newSize == 's') {
      basePrice.value = finalItem.price - 1.50;
    } else if (newSize == 'm') {
      basePrice.value = finalItem.price;
    } else if (newSize == 'l') {
      basePrice.value = finalItem.price + 1.50;
    }
    //calculateUnitaryPrice();
    print(currentSize);
  }

  void changeAmountSugar(int newAmountCubesSugar) {
    //currentSugar.value = newAmountCubesSugar;
    if (newAmountCubesSugar == 1 && currentSugar.value != newAmountCubesSugar) {
      changeSize(currentSize.value);
      basePrice.value = basePrice.value + 0.50;
      currentSugar.value = newAmountCubesSugar;
      //changeSize(currentSize.value);
    } else if (newAmountCubesSugar == 2 &&
        currentSugar.value != newAmountCubesSugar) {
      changeSize(currentSize.value);
      basePrice.value = basePrice.value + 1;
      currentSugar.value = newAmountCubesSugar;
      //changeSize(currentSize.value);
    } else if (newAmountCubesSugar == 3 &&
        currentSugar.value != newAmountCubesSugar) {
      changeSize(currentSize.value);
      basePrice.value = basePrice.value + 1.5;
      currentSugar.value = newAmountCubesSugar;
      //changeSize(currentSize.value);
    } else if (newAmountCubesSugar == 0) {
      currentSugar.value = newAmountCubesSugar;
      changeSize(currentSize.value);
    }
    //calculateUnitaryPrice();
    print(newAmountCubesSugar);
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
    print(amountItems);
  }

  void increment() {
    var uniValue = basePrice.value / amountItems.value;
    amountItems.value = amountItems.value + 1;
    basePrice.value = uniValue * amountItems.value;
    print(amountItems);
  }

  void show() {
    finalItem.size = currentSize.value;
    finalItem.cube = currentSugar.value;
    finalItem.amount = amountItems.value;
    finalItem.price =
        ((basePrice.value * amountItems.value) + (currentSugar.value * 0.50));
    print(finalItem.toJson());
  }

  void goToCar() async {
    Get.toNamed(
      AppRoutes.cartScreen,
    );
  }
}
