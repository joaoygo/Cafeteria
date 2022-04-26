import '../models/item_model.dart';

abstract class ICartScreenRepository {
  Future<List<ItemModel>> getItems();
}
