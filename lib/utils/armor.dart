//import 'package:flutter_mhwdb_app/utils/armor_assets.dart';
import 'package:flutter_mhwdb_app/utils/defense.dart';
import 'package:flutter_mhwdb_app/utils/materials.dart';
import 'package:flutter_mhwdb_app/utils/resistances.dart';
import 'package:flutter_mhwdb_app/utils/skill_rank.dart';
import 'package:flutter_mhwdb_app/utils/slot.dart';

class Armor {
  final String name;
  final int rarity;
  final Defense defense;
  final Resistances resistances;
  final List<Slot> slots;
  final List<SkillRank> skills;
  //final ArmorAssets armorAssets;
  final Materials crafting;

  Armor({
    this.name,
    this.rarity,
    this.defense,
    this.resistances,
    this.slots,
    this.skills,
    //this.armorAssets,
    this.crafting,
  });

  factory Armor.fromJson(dynamic json) {
    if (json["slots"] != null && json["skills"] != null) {
      var jsonSlots = json["slots"] as List;
      var jsonSkills = json["skills"] as List;

      List<Slot> _slots =
          jsonSlots.map((slotsInJson) => Slot.fromJson(slotsInJson)).toList();
      List<SkillRank> _skills = jsonSkills
          .map((skillsInJson) => SkillRank.fromJson(skillsInJson))
          .toList();

      return Armor(
          name: json["name"],
          rarity: json["rarity"],
          defense: Defense.fromJason(json["defense"]),
          resistances: Resistances.fromJson(json["resistances"]),
          slots: _slots,
          skills: _skills,
          //armorAssets: ArmorAssets.fromJson(json["assets"]),
          crafting: Materials.fromJson(json["crafting"]));
    } else if (json["slots"] != null) {
      var jsonSlots = json["slots"] as List;

      List<Slot> _slots =
          jsonSlots.map((slotsInJson) => Slot.fromJson(slotsInJson)).toList();

      return Armor(
          name: json["name"],
          rarity: json["rarity"],
          defense: Defense.fromJason(json["defense"]),
          resistances: Resistances.fromJson(json["resistances"]),
          slots: _slots,
          skills: null,
          // armorAssets: ArmorAssets.fromJson(json["assets"]),
          crafting: Materials.fromJson(json["crafting"]));
    } else if (json["skills"] != null) {
      var jsonSkills = json["skills"] as List;

      List<SkillRank> _skills = jsonSkills
          .map((skillsInJson) => SkillRank.fromJson(skillsInJson))
          .toList();

      return Armor(
          name: json["name"],
          rarity: json["rarity"],
          defense: Defense.fromJason(json["defense"]),
          resistances: Resistances.fromJson(json["resistances"]),
          slots: null,
          skills: _skills,
          // armorAssets: ArmorAssets.fromJson(json["assets"]),
          crafting: Materials.fromJson(json["crafting"]));
    } else {
      return Armor(
          name: json["name"],
          rarity: json["rarity"],
          defense: Defense.fromJason(json["defense"]),
          resistances: Resistances.fromJson(json["resistances"]),
          slots: null,
          skills: null,
          // armorAssets: ArmorAssets.fromJson(json["assets"]),
          crafting: Materials.fromJson(json["crafting"]));
    }
  }
}
