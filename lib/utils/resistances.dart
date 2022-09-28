class Resistances {
  final int fire;
  final int water;
  final int ice;
  final int thunder;
  final int dragon;

  Resistances({this.fire, this.water, this.ice, this.thunder, this.dragon});

  factory Resistances.fromJson(dynamic json) {
    return Resistances(
        fire: json["fire"],
        water: json["water"],
        ice: json["ice"],
        thunder: json["thunder"],
        dragon: json["dragon"]);
  }
}
