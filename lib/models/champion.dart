class Champion {
  String id;
  String name;
  String title;
  String blurb;
  dynamic attackInfo;
  dynamic defenseInfo;
  dynamic magicInfo;
  dynamic difficultyInfo;
  List<dynamic> tags;
  String partype;
  dynamic hp;
  dynamic hpperlevel;
  dynamic mp;
  dynamic mpperlevel;
  dynamic movespeed;
  dynamic armor;
  dynamic armorperlevel;
  dynamic spellblock;
  dynamic spellblockperlevel;
  dynamic attackrange;
  dynamic hpregen;
  dynamic hpregenperlevel;
  dynamic mpregen;
  dynamic mpregenperlevel;
  dynamic attackdamage;
  dynamic attackdamageperlevel;
  dynamic attackspeedperlevel;
  dynamic attackspeed;

  Champion(
      {this.id,
      this.name,
      this.title,
      this.blurb,
      this.attackInfo,
      this.defenseInfo,
      this.magicInfo,
      this.difficultyInfo,
      this.tags,
      this.partype,
      this.hp,
      this.hpperlevel,
      this.mp,
      this.mpperlevel,
      this.movespeed,
      this.armor,
      this.armorperlevel,
      this.spellblock,
      this.spellblockperlevel,
      this.attackrange,
      this.hpregen,
      this.hpregenperlevel,
      this.mpregen,
      this.mpregenperlevel,
      this.attackdamage,
      this.attackdamageperlevel,
      this.attackspeedperlevel,
      this.attackspeed});

  factory Champion.fromJson(Map<String, dynamic> json) {
    return Champion(
      id: json['id'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      blurb: json['blurb'] as String,
      attackInfo: json['info']['attack'] as int,
      defenseInfo: json['info']['defense'] as int,
      magicInfo: json['info']['magic'] as int,
      difficultyInfo: json['info']['difficulty'] as int,
      tags: json['tags'] as List<dynamic>,
      partype: json['partype'] as String,
      hp: json['stats']['hp'],
      hpperlevel: json['stats']['hpperlevel'],
      mp: json['stats']['mp'],
      mpperlevel: json['stats']['mpperlevel'],
      movespeed: json['stats']['movespeed'],
      armor: json['stats']['armor'],
      armorperlevel: json['stats']['armorperlevel'],
      spellblock: json['stats']['spellblock'],
      spellblockperlevel: json['stats']['spellblockperlevel'],
      attackrange: json['stats']['attackrange'],
      hpregen: json['stats']['hpregen'],
      hpregenperlevel: json['stats']['hpregenperlevel'],
      mpregen: json['stats']['mpregen'],
      mpregenperlevel: json['stats']['mpregenperlevel'],
      attackdamage: json['stats']['attackdamage'],
      attackdamageperlevel: json['stats']['attackdamageperlevel'],
      attackspeed: json['stats']['attackspeed'],
      attackspeedperlevel: json['stats']['attackspeedperlevel'],
    );
  }
}
