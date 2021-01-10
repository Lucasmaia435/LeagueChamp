import 'package:flutter/material.dart';
import 'package:leagueChamp/models/champion.dart';
import 'dart:convert' show utf8;

import 'package:leagueChamp/screens/champion/champion_page.dart';
import 'package:leagueChamp/styles/fonts.dart';

class ChampionCard extends StatelessWidget {
  ChampionCard({Key key, this.champion}) : super(key: key);

  final Champion champion;
  @override
  Widget build(BuildContext context) {
    String imgName = champion.id;

    navigateToChampionPage(String id) async {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChampionPage(
            champion: champion,
            tag: id,
          ),
        ),
      );
    }

    return InkWell(
      onTap: () {
        FocusManager.instance.primaryFocus.unfocus();
        Future.delayed(const Duration(milliseconds: 300), () {
          navigateToChampionPage(imgName);
        });
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Hero(
          tag: 'selected-champ-$imgName',
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Image.network(
                'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${imgName}_0.jpg',
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.black.withAlpha(0),
                      Colors.black12,
                      Colors.black45
                    ],
                  ),
                ),
                child: Text(
                  utf8.decode(champion.name.toString().codeUnits),
                  style: AppFonts.championsListName,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
