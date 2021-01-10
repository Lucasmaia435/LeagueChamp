class Spell {
  String id;
  String name;
  String description;
  String tooltip;
  List<dynamic> cooldown;
  String cooldownBurn;
  List<dynamic> cost;
  String costBurn;
  List<dynamic> range;
  String rangeBurn;
  String imgName;

  Spell({
    this.id,
    this.name,
    this.description,
    this.tooltip,
    this.cooldown,
    this.cooldownBurn,
    this.cost,
    this.costBurn,
    this.range,
    this.rangeBurn,
    this.imgName,
  });

  factory Spell.fromJson(Map<String, dynamic> json) {
    return Spell(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        tooltip: json['tooltip'],
        cooldown: json['cooldown'],
        cooldownBurn: json['cooldownBurn'],
        cost: json['cost'],
        costBurn: json['costBurn'],
        range: json['range'],
        rangeBurn: json['rangeBurn'],
        imgName: json['image']['full']);
  }
}
