class Recovery {
  List<dynamic> actions;
  // List<Item> items;

  Recovery({
    this.actions,
  });

  factory Recovery.fromJson(dynamic json) {
    if (json["actions"] != null) {
      var jsonActions = json["actions"] as List;
      return Recovery(actions: jsonActions);
    } else {
      return Recovery(actions: null);
    }
  }
}
