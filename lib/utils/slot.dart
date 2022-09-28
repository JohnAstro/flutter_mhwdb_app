class Slot {
  final int rank;

  Slot({this.rank});

  factory Slot.fromJson(dynamic json) {
    return Slot(rank: json["rank"]);
  }
}
