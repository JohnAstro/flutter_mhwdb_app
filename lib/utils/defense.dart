class Defense {
  final int base;
  final int max;
  final int augmented;

  Defense({this.base, this.max, this.augmented});

  factory Defense.fromJason(dynamic json) {
    return Defense(
        base: json["base"], max: json["max"], augmented: json["augmented"]);
  }
}
