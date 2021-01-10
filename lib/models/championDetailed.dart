import 'package:leagueChamp/models/passive.dart';
import 'package:leagueChamp/models/skins.dart';
import 'package:leagueChamp/models/spell.dart';

class ChampionDetailed {
  // Description
  String id;

  String name;
  String title;
  String blurb;
  String lore;

  // Info
  int attackInfo;
  int defenseInfo;
  int magicInfo;
  int difficultyInfo;

  // Filter
  List<dynamic> tags;
  String partype;

  // Status
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

  //Skills
  Passive passive;
  Spell q;
  Spell w;
  Spell e;
  Spell r;

  //Skins
  List<Skin> skins;

  ChampionDetailed({
    this.id,
    this.name,
    this.title,
    this.blurb,
    this.lore,
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
    this.attackspeed,
    this.passive,
    this.q,
    this.w,
    this.e,
    this.r,
    this.skins,
  });

  factory ChampionDetailed.fromJson(Map<String, dynamic> json) {
    List<Skin> loadSkins = [];
    for (int i = 0; i < json['skins'].length; i++) {
      Skin s = Skin.fromJson(json['skins'][i]);

      loadSkins.add(s);
    }
    return ChampionDetailed(
      id: json['id'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      blurb: json['blurb'] as String,
      lore: json['lore'] as String,
      attackInfo: json['info']['attack'] as int,
      defenseInfo: json['info']['defense'] as int,
      magicInfo: json['info']['magic'] as int,
      difficultyInfo: json['info']['difficulty'] as int,
      tags: json['tags'],
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
      passive: Passive.fromJson(json['passive']),
      q: Spell.fromJson(json['spells'][0]),
      w: Spell.fromJson(json['spells'][1]),
      e: Spell.fromJson(json['spells'][2]),
      r: Spell.fromJson(json['spells'][3]),
      skins: loadSkins,
    );
  }
}
