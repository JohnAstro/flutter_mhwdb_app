class Item {
  final String name;
  final String desc;
  final int rarity;
  final int carryLimit;
  final int value;

  Item({this.name, this.desc, this.rarity, this.carryLimit, this.value});

  factory Item.fromJson(dynamic json) {
    return Item(
        name: json["name"],
        desc: json["description"],
        rarity: json["rarity"],
        carryLimit: json["carryLimit"],
        value: json["value"]);
  }
}
