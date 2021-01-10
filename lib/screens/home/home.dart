import 'package:flutter/material.dart';
import 'package:leagueChamp/screens/home/local_widgets/champion_list.dart';
import 'package:leagueChamp/screens/home/local_widgets/searchBar.dart';
import 'package:leagueChamp/screens/home/local_widgets/title.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
      child: Column(
        children: [
          HomeTitle(),
          SizedBox(
            height: 25,
          ),
          SearchChampion(),
          SizedBox(),
          ChampionList(),
        ],
      ),
    );
  }
}
