class ArmorAssets {
  final String imageMale;
  final String imageFemale;

  ArmorAssets({this.imageMale, this.imageFemale});

  factory ArmorAssets.fromJson(dynamic json) {
    return ArmorAssets(
        imageMale: json["imageMale"], imageFemale: json["imageFemale"]);
  }
}
