import 'package:flutter_mhwdb_app/utils/crafting_cost.dart';

class Materials {
  final List<CraftingCost> materials;

  Materials({this.materials});

  factory Materials.fromJson(dynamic json) {
    if (json["materials"] != null) {
      var jsonMaterials = json["materials"] as List;

      List<CraftingCost> _materials = jsonMaterials
          .map((materialsInJson) => CraftingCost.fromJson(materialsInJson))
          .toList();
      return Materials(materials: _materials);
    } else {
      return Materials(materials: null);
    }
  }
}
