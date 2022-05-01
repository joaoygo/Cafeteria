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
  RxDouble priceSize = 0.0.obs;
  RxDouble priceSugar = 0.0.obs;
  RxDouble priceFinal = 0.0.obs;

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
    amountItems.value = finalItem.amount;
    changeSize('s');
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
    if (newSize == 's' && amountItems.value == 1) {
      priceSize.value = 0.0;
      currentSize.value = newSize;
      priceUnit();
    } else if (newSize == 'm' && amountItems.value == 1) {
      priceSize.value = 1.50;
      currentSize.value = newSize;
      priceUnit();
    } else if (newSize == 'l' && amountItems.value == 1) {
      priceSize.value = 2.5;
      currentSize.value = newSize;
      priceUnit();
    }
  }

  void changeAmountSugar(int newAmountCubesSugar) {
    if (newAmountCubesSugar == 1 && amountItems.value == 1) {
      priceSugar.value = 0.25;
      currentSugar.value = newAmountCubesSugar;
      priceUnit();
    } else if (newAmountCubesSugar == 2 && amountItems.value == 1) {
      priceSugar.value = 0.50;
      currentSugar.value = newAmountCubesSugar;
      priceUnit();
    } else if (newAmountCubesSugar == 3 && amountItems.value == 1) {
      priceSugar.value = 0.75;
      currentSugar.value = newAmountCubesSugar;
      priceUnit();
    } else if (newAmountCubesSugar == 0 && amountItems.value == 1) {
      priceSugar.value = 0.0;
      currentSugar.value = newAmountCubesSugar;
      priceUnit();
    }
  }

  void priceUnit() {
    priceFinal.value = (priceSize.value + priceSugar.value) + finalItem.price;
  }

  void decrement() {
    if (amountItems.value == 1) {
      priceFinal.value = priceFinal.value / amountItems.value;
      amountItems.value = 1;
      priceFinal.value = priceFinal.value * amountItems.value;
    } else {
      priceFinal.value = priceFinal.value / amountItems.value;
      amountItems.value = amountItems.value - 1;
      priceFinal.value = priceFinal.value * amountItems.value;
    }
  }

  void increment() {
    priceFinal.value = priceFinal.value / amountItems.value;
    amountItems.value = amountItems.value + 1;
    priceFinal.value = priceFinal.value * amountItems.value;
  }

  void addItemCart() {
    finalItem.size = currentSize.value;
    finalItem.cube = currentSugar.value;
    finalItem.amount = amountItems.value;
    finalItem.price = priceFinal.value;

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
