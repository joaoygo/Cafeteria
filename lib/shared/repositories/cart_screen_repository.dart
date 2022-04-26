import 'dart:convert';

import '../interfaces/i_cart_screen_repository.dart';
import '../models/item_model.dart';
import 'package:http/http.dart' as http;

class CartScreenRepository implements ICartScreenRepository {
  @override
  Future<List<ItemModel>> getItems() async {
    try {
      final Uri url = Uri.parse(
          'https://62617442327d3896e27c08f5.mockapi.io/syscoffe/1/cart');
      final response = await http.get(url);
      final List<dynamic> responseMap = jsonDecode(response.body);
      return responseMap.map((res) => ItemModel.fromMap(res)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
