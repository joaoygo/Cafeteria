import 'package:cafeteira_ygo/shared/models/item_model.dart';

abstract class IHomeScreenRepository {
  Future<List<ItemModel>> getItems();
  Future<List<ItemModel>> searchItems(String nameItem);
  void postItems(ItemModel item);
}
