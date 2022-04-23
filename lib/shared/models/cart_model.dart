import 'dart:convert';

import 'package:cafeteira_ygo/shared/models/item_model.dart';

class CartModel {
  final List<ItemModel> itemSelect;
  CartModel({
    required this.itemSelect,
  });

  Map<String, dynamic> toMap() {
    return {
      'itemSelect': itemSelect.map((x) => x.toMap()).toList(),
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      itemSelect: List<ItemModel>.from(
          map['itemSelect']?.map((x) => ItemModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source));
}
