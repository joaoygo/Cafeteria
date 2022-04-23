import 'dart:convert';

class ItemModel {
  final String id;
  final String name;
  final int amount;
  final String size;
  final double price;
  final int cube;
  final String avatar;
  final String syscoffeId;
  ItemModel({
    required this.id,
    required this.name,
    required this.amount,
    required this.size,
    required this.price,
    required this.cube,
    required this.avatar,
    required this.syscoffeId,
  });

  static ItemModel init() {
    return ItemModel(
        id: "",
        name: "",
        amount: 0,
        size: "",
        price: 0,
        cube: 0,
        avatar: "",
        syscoffeId: "");
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'size': size,
      'price': price,
      'cube': cube,
      'avatar': avatar,
      'syscoffeId': syscoffeId,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      amount: map['amount']?.toInt() ?? 0,
      size: map['size'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      cube: map['cube']?.toInt() ?? 0,
      avatar: map['avatar'] ?? '',
      syscoffeId: map['syscoffeId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source));
}
