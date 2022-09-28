import 'dart:io';

import 'package:flutter_mhwdb_app/utils/item.dart';
import 'package:flutter_mhwdb_app/utils/skill.dart';

class Protection {
  final List<Item> items;
  final List<Skill> skills;

  Protection({this.items, this.skills});

  factory Protection.fromJson(dynamic json) {
    if (json["items"] != null && json["skills"] != null) {
      var jsonSkills = json["skills"] as List;
      var jsonItems = json["items"] as List;

      List<Item> _items =
          jsonItems.map((itemInJson) => Item.fromJson(itemInJson)).toList();

      List<Skill> _skills = jsonSkills
          .map((skillsInJson) => Skill.fromJson(skillsInJson))
          .toList();

      return Protection(items: _items, skills: _skills);
    } else if (json["items"] != null) {
      var jsonItems = json["items"] as List;

      List<Item> _items =
          jsonItems.map((itemInJson) => Item.fromJson(itemInJson)).toList();
      return Protection(items: _items, skills: null);
    } else if (json["skills"] != null) {
      var jsonSkills = json["skills"] as List;
      List<Skill> _skills = jsonSkills
          .map((skillsInJson) => Skill.fromJson(skillsInJson))
          .toList();
      return Protection(items: null, skills: _skills);
    } else {
      return Protection(items: null, skills: null);
    }
  }
}
