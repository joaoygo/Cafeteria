import 'package:cafeteira_ygo/core/common/constants/texts_constants.dart';
import 'package:cafeteira_ygo/core/routes/app_routes.dart';
import 'package:cafeteira_ygo/shared/interfaces/i_home_screen_repository.dart';
import 'package:cafeteira_ygo/shared/models/item_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController with StateMixin {
  final inputSearchItemController = TextEditingController();

  final IHomeScreenRepository _iHomeScreenRepository;
  HomeScreenController(this._iHomeScreenRepository);

  @override
  void onInit() {
    super.onInit();
    findItems();
  }

  void inputSearchItem() {
    searchItems(inputSearchItemController.text);
  }

  Future<void> findItems() async {
    change([], status: RxStatus.loading());
    try {
      final items = await _iHomeScreenRepository.getItems();
      change(items, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error(TextsConstants.erroSearchItems));
    }
  }

  Future<void> searchItems(String nameItem) async {
    change([], status: RxStatus.loading());
    try {
      final items = await _iHomeScreenRepository.searchItems(nameItem);
      change(items, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error(TextsConstants.erroSearchItems));
    }
  }

  void goToDetails(ItemModel item) async {
    // change([], status: RxStatus.loading());
    // try {
    //   _iHomeScreenRepository.postItems(item);
    //   change([], status: RxStatus.success());
    // } catch (e) {
    //   change([],
    //       status: RxStatus.error(TextsConstants.errorWhenAddingItemToCart));
    // }

    Get.toNamed(
      AppRoutes.detailsSelectionScreen,
      arguments: item,
    );
  }
}
