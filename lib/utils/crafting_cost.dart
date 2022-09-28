import 'package:flutter_mhwdb_app/utils/item.dart';

class CraftingCost {
  final int quantity;
  final Item item;

  CraftingCost({this.quantity, this.item});

  factory CraftingCost.fromJson(dynamic json) {
    return CraftingCost(
        quantity: json["quantity"], item: Item.fromJson(json["item"]));
  }
}
