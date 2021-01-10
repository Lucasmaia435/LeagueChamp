import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:leagueChamp/screens/home/local_widgets/champion_card.dart';
import 'package:leagueChamp/state/championsState/championsState.dart';
import 'package:leagueChamp/state/selectedChampionState/selectedChampionState.dart';

class ChampionList extends StatefulWidget {
  @override
  _ChampionListState createState() => _ChampionListState();
}

class _ChampionListState extends State<ChampionList> {
  ChampionsState store;
  SelectedChampionState _selectedChampionState;
  @override
  void initState() {
    super.initState();
    store = GetIt.I.get();
    _selectedChampionState = GetIt.I.get();
    _selectedChampionState.emptyChampion();
    store.updateChampions();
    store.updatePermanent();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        _selectedChampionState.champion = null;
        if (store.champions.isNotEmpty) {
          return Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  store.champions.length,
                  (index) => ChampionCard(
                    champion: store.champions[index],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
