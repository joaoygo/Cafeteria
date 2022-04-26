import 'dart:convert';
import 'package:cafeteira_ygo/shared/interfaces/i_details_selection_screen_repository.dart';
import 'package:cafeteira_ygo/shared/models/item_model.dart';
import 'package:http/http.dart' as http;

class DetailsSelectionScreenRepository implements IDetailsSelectionScreenRepository {
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
