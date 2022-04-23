import 'dart:convert';

import 'package:cafeteira_ygo/shared/interfaces/i_home_screen_repository.dart';
import 'package:cafeteira_ygo/shared/models/item_model.dart';
import 'package:http/http.dart' as http;

class HomeScreenRepository implements IHomeScreenRepository {
  @override
  Future<List<ItemModel>> getItems() async {
    try {
      final Uri url = Uri.parse(
          'https://62617442327d3896e27c08f5.mockapi.io/syscoffe/1/items');
      final response = await http.get(url);
      final List<dynamic> responseMap = jsonDecode(response.body);
      return responseMap.map((res) => ItemModel.fromMap(res)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ItemModel>> searchItems(String nameItem) async {
    try {
      final Uri url = Uri.parse(
          'https://62617442327d3896e27c08f5.mockapi.io/syscoffe/1/items?search=$nameItem');
      final response = await http.get(url);
      final List<dynamic> responseMap = jsonDecode(response.body);
      return responseMap.map((res) => ItemModel.fromMap(res)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  void postItems(ItemModel item) async {
    try {
      final Uri urlPost = Uri.parse(
          'https://62617442327d3896e27c08f5.mockapi.io/syscoffe/1/cart');
      await http.post(
        urlPost,
        headers: {
          "content-type": "application/json",
        },
        body: jsonEncode(
          {
            "idItemSelect": item.id,
            "name": item.name,
            "amount": item.amount,
            "size": item.size,
            "price": item.price,
            "cube": item.cube,
            "avatar": item.avatar,
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
