import 'package:leagueChamp/models/championDetailed.dart';
import 'package:leagueChamp/service/api.dart';
import 'package:mobx/mobx.dart';

part 'selectedChampionState.g.dart';

class SelectedChampionState = _SelectedChampionStateBase
    with _$SelectedChampionState;

abstract class _SelectedChampionStateBase with Store {
  @observable
  ChampionDetailed champion;

  @action
  void selectChampion(String id) {
    fetchChampionDetailed(id).then((value) => updateChampion(value));
  }

  @action
  void updateChampion(ChampionDetailed c) {
    champion = c;
  }

  @action
  void emptyChampion() {
    champion = null;
  }
}
