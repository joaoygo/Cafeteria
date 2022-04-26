import 'package:cafeteira_ygo/shared/interfaces/i_cart_screen_repository.dart';
import 'package:cafeteira_ygo/shared/models/item_model.dart';
import 'package:get/get.dart';

import '../../core/common/constants/texts_constants.dart';

class CartScreenController extends GetxController with StateMixin {
  Rx<ItemModel> item = ItemModel.init().obs;

  final ICartScreenRepository _iCartScreenRepository;
  CartScreenController(this._iCartScreenRepository);

  @override
  void onInit() {
    super.onInit();
    findItemsCart();
  }

  Future<void> findItemsCart() async {
    change([], status: RxStatus.loading());
    try {
      final items = await _iCartScreenRepository.getItems();
      change(items, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error(TextsConstants.erroSearchItems));
    }
  }
}
