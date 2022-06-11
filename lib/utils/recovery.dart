import 'package:flutter_mhwdb_app/utils/item.dart';

class Recovery {
  final List<dynamic> actions;
  final List<Item> items;

  Recovery({this.actions, this.items});

  factory Recovery.fromJson(dynamic json) {
    if (json["actions"] != null && json["items"] != null) {
      var jsonActions = json["actions"] as List;
      var jsonItems = json["items"] as List;
      List<Item> _items =
          jsonItems.map((itemInJson) => Item.fromJson(itemInJson)).toList();
      return Recovery(actions: jsonActions, items: _items);
    } else if (json["actions"] != null) {
      var jsonActions = json["actions"] as List;
      return Recovery(actions: jsonActions, items: null);
    } else if (json["items " != null]) {
      var jsonItems = json["items"] as List;
      List<Item> _items =
          jsonItems.map((itemInJson) => Item.fromJson(itemInJson)).toList();
      return Recovery(actions: null, items: _items);
    } else {
      return Recovery(actions: null, items: null);
    }
  }
}
