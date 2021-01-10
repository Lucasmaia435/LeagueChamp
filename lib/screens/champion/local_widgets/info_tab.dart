import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:leagueChamp/models/championDetailed.dart';
import 'package:leagueChamp/models/passive.dart';
import 'package:leagueChamp/models/skins.dart';
import 'package:leagueChamp/models/spell.dart';
import 'package:leagueChamp/state/selectedChampionState/selectedChampionState.dart';
import 'package:leagueChamp/styles/fonts.dart';
import 'package:leagueChamp/utils/skill_string.dart';
import 'package:leagueChamp/utils/utf8_string.dart';

import '../champion_page.dart';

class InfoChampionTab extends StatefulWidget {
  InfoChampionTab({@required this.store});

  final SelectedChampionState store;
  @override
  _InfoChampionTabState createState() => _InfoChampionTabState();
}

class _InfoChampionTabState extends State<InfoChampionTab> {
  SelectedChampionState store;
  int _currentSkin = 0;

  @override
  void initState() {
    super.initState();

    store = widget.store;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          loreTile,
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: sessionTitle(
              title: 'Skins',
            ),
          ),
          skinsSliders,
          _skillList(c: store.champion),
        ],
      ),
    );
  }

  Widget get loreTile {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sessionTitle(title: 'Lore'),
          Text(formatUTF8(store.champion?.lore),
              style: AppFonts.sectionContent),
        ],
      ),
    );
  }

  Widget _skillList({@required ChampionDetailed c}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: sessionTitle(title: 'Habilidades'),
        ),
        _skillCard(isPassive: true, passive: c?.passive),
        _skillCard(spell: c?.q, label: 'Q'),
        _skillCard(spell: c?.w, label: 'W'),
        _skillCard(spell: c?.e, label: 'E'),
        _skillCard(spell: c?.r, label: 'R'),
      ],
    );
  }

  Widget _skillCard(
      {bool isPassive = false,
      Spell spell,
      Passive passive,
      String label = 'P'}) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    'http://ddragon.leagueoflegends.com/cdn/10.25.1/img/${isPassive ? 'passive' : 'spell'}/${isPassive ? passive.imgName : spell.imgName}',
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              Text(
                isPassive
                    ? '${formatUTF8(passive?.name)} ($label)'
                    : '${formatUTF8(spell?.name)} ($label)',
                style: AppFonts.sectionSubTitle,
              ),
            ],
          ),
          Container(
            child: Text(
              isPassive
                  ? formatSkill(passive?.description)
                  : formatSkill(spell?.description),
              style: AppFonts.sectionContent,
            ),
          ),
        ],
      ),
    );
  }

  Widget get skinsSliders {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              onPageChanged: (index, _) {
                setState(() {
                  _currentSkin = index;
                });
              }),
          items: store.champion.skins.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: InkWell(
                    onTap: () => _expandSkin(context, i),
                    child: Hero(
                      tag: 'skin-tag${i.nume}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Image.network(
                          'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${store.champion.id}_${i.nume}.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            formatUTF8(store.champion.skins[_currentSkin].name == 'default'
                ? store.champion.name
                : store.champion.skins[_currentSkin].name),
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }

  void _expandSkin(BuildContext context, Skin i) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Scaffold(
          backgroundColor: Colors.white70,
          body: Center(
            child: Hero(
              tag: 'skin-tag${i.nume}',
              child: Image.network(
                'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${store.champion.id}_${i.nume}.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
