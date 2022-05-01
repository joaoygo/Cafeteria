import 'package:cafeteira_ygo/shared/interfaces/i_cart_screen_repository.dart';
import 'package:cafeteira_ygo/shared/models/item_model.dart';
import 'package:get/get.dart';

class CartScreenController extends GetxController with StateMixin {
  RxList<ItemModel> newItems = <ItemModel>[].obs;
  RxDouble priceTotal = 0.0.obs;
  RxDouble priceItemFinal = 0.0.obs;
  RxInt amountItems = 0.obs;
  final ICartScreenRepository _iCartScreenRepository;
  CartScreenController(this._iCartScreenRepository);

  @override
  Future<void> onInit() async {
    super.onInit();
    await findItemsCart();
    getPriceTotal();
  }

  Future<void> findItemsCart() async {
    try {
      final items = await _iCartScreenRepository.getItems();
      newItems.value = items;
    } catch (e) {}
  }

  getPriceTotal() {
    for (var i = 0; i < newItems.length; i++) {
      priceTotal.value = priceTotal.value + newItems[i].price;
    }
  }

  void decrement(int index) {
    if (newItems[index].amount == 1) {
      newItems[index].price = newItems[index].price / newItems[index].amount;
      newItems[index].amount = 1;
      newItems[index].price = newItems[index].price * newItems[index].amount;
    } else {
      newItems[index].price = newItems[index].price / newItems[index].amount;
      newItems[index].amount = newItems[index].amount - 1;
      newItems[index].price = newItems[index].price * newItems[index].amount;
    }
    priceTotal.value = 0;
    getPriceTotal();
  }

  void increment(int index) {
    newItems[index].price = newItems[index].price / newItems[index].amount;
    newItems[index].amount = newItems[index].amount + 1;
    newItems[index].price = newItems[index].price * newItems[index].amount;
    priceTotal.value = 0;
    getPriceTotal();
  }
}
