import 'package:flutter/material.dart';
import 'package:leagueChamp/state/selectedChampionState/selectedChampionState.dart';
import 'package:leagueChamp/utils/map.dart';

class StatusChampionTab extends StatefulWidget {
  StatusChampionTab({@required this.store});

  final SelectedChampionState store;
  @override
  _StatusChampionTabState createState() => _StatusChampionTabState();
}

class _StatusChampionTabState extends State<StatusChampionTab> {
  SelectedChampionState store;

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
          functionStatus,
          Divider(),
          infoStatus,
          Divider(),
          dataStatus
        ],
      ),
    );
  }

  Widget get functionStatus {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Função: ${store.champion.tags[0]}',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }

  Widget get dataStatus {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          //HP ROW
          dataCell(title: 'Vida', value: store.champion.hp, color: Colors.red),
          dataCell(
            title: 'Vida por level',
            value: store.champion.hpperlevel,
            color: Colors.red,
            isPerLevel: true,
          ),

          dataCell(
            title: 'Regen. de Vida',
            value: store.champion.hpregen,
            color: Colors.red,
          ),

          dataCell(
            title: 'Regen. de vida por level',
            value: store.champion.hpregenperlevel,
            color: Colors.red,
            isPerLevel: true,
          ),

          //MP ROW
          if (store.champion.mp != 0)
            dataCell(
              title: store.champion.partype == "Mana" ? "Mana" : "Energia",
              value: store.champion.mp,
              color: store.champion.partype == "Mana"
                  ? Colors.blue
                  : Colors.yellow,
            ),

          if (store.champion.partype == 'Mana')
            dataCell(
              title: 'Mana por level',
              value: store.champion.mpperlevel,
              color: Colors.blue,
              isPerLevel: true,
            ),

          //MP REGEN
          if (store.champion.mp != 0)
            dataCell(
              title:
                  'Regen. de ${store.champion.partype == "Mana" ? "Mana" : "Energia"}',
              value: store.champion.mpregen,
              color: store.champion.partype == "Mana"
                  ? Colors.blue
                  : Colors.yellow,
            ),
          if (store.champion.partype == 'Mana')
            dataCell(
              title: 'Regen. de Mana por level',
              value: store.champion.mpregenperlevel,
              color: Colors.blue,
              isPerLevel: true,
            ),
          //ARMOR ROW

          dataCell(
            title: 'Armadura',
            value: store.champion.armor,
            color: Colors.orange,
          ),

          dataCell(
            title: 'Armadura por level',
            value: store.champion.armorperlevel,
            color: Colors.orange,
            isPerLevel: true,
          ),

          //MR ROW

          dataCell(
            title: 'Res. Mágica',
            value: store.champion.spellblock,
            color: Colors.purple,
          ),

          dataCell(
            title: 'Res. Mágica por level',
            value: store.champion.spellblockperlevel,
            color: Colors.purple,
            isPerLevel: true,
          ),

          //ATTACK ROW

          dataCell(
            title: 'Dano físico',
            value: store.champion.attackdamage,
            color: Colors.redAccent,
          ),

          dataCell(
            title: 'Dano físico por level',
            value: store.champion.attackdamageperlevel,
            color: Colors.redAccent,
            isPerLevel: true,
          ),
          //ROW ATTACK SPEED

          dataCell(
            title: 'Vel. de Ataque',
            value: store.champion.attackspeed,
            color: Colors.lightBlue,
          ),

          dataCell(
            title: 'Vel. de Ataque por level',
            value: store.champion.attackspeedperlevel,
            color: Colors.lightBlue,
            isPerLevel: true,
          ),

          // RANGE & MOV. SPEED

          dataCell(
            title: 'Alcance de Ataque',
            value: store.champion.attackrange,
            color: Colors.blueGrey,
          ),

          dataCell(
            title: 'Vel. de movimento',
            value: store.champion.movespeed,
            color: Colors.brown,
          ),
        ],
      ),
    );
  }

  Widget dataCell({
    @required String title,
    @required dynamic value,
    @required Color color,
    bool isPerLevel = false,
  }) {
    Widget titleRow = Row(
      children: [
        Container(
          width: 4,
          height: 10,
          color: color,
          margin: EdgeInsets.only(right: 5),
        ),
        Text('$title :'),
      ],
    );

    Widget valueRow = Row(
      children: [
        Text(' $value'),
        if (isPerLevel)
          Icon(
            Icons.trending_up,
            size: 14,
          ),
      ],
    );
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [titleRow, valueRow],
      ),
    );
  }

  Widget get infoStatus {
    return Column(
      children: [
        infoBars(
            title: 'Dificuldade',
            number: map(store.champion.difficultyInfo, 1, 10, 1, 5)),
        infoBars(
            title: 'Ataque',
            number: map(store.champion.attackInfo, 1, 10, 1, 5)),
        infoBars(
            title: 'Magia', number: map(store.champion.magicInfo, 1, 10, 1, 5)),
        infoBars(
            title: 'Defesa',
            number: map(store.champion.defenseInfo, 1, 10, 1, 5)),
      ],
    );
  }

  Widget infoBars({@required String title, @required int number}) {
    List<Widget> children = [Text(title)];
    Color color;
    if (title == 'Dificuldade') color = Colors.orange;
    if (title == 'Ataque') color = Colors.red;
    if (title == 'Magia') color = Colors.blue;
    if (title == 'Defesa') color = Colors.green;

    for (int i = 0; i < number; i++) {
      Widget c = Container(
        margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        height: 10,
        width: 40,
      );

      children.add(c);
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: children,
      ),
    );
  }
}
