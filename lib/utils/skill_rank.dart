class SkillRank {
  final int level;
  final String desc;
  final String skillName;

  SkillRank({this.level, this.desc, this.skillName});

  factory SkillRank.fromJson(dynamic json) {
    return SkillRank(
        level: json["level"],
        desc: json["decsription"],
        skillName: json["skillName"]);
  }
}
