import 'package:flutter_mhwdb_app/utils/skill_rank.dart';

class Skill {
  final String name;
  final String desc;
  final List<SkillRank> ranks;

  Skill({this.name, this.desc, this.ranks});

  factory Skill.fromJson(dynamic json) {
    if (json["ranks"] != null) {
      var jsonRanks = json["ranks"] as List;

      List<SkillRank> _ranks = jsonRanks
          .map((rankInJson) => SkillRank.fromJson(rankInJson))
          .toList();
      return Skill(
          name: json["name"], desc: json["description"], ranks: _ranks);
    }
    return Skill(name: json["name"], desc: json["description"], ranks: null);
  }
}
