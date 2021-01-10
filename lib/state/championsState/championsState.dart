import 'package:leagueChamp/models/champion.dart';
import 'package:leagueChamp/service/api.dart';
import 'package:mobx/mobx.dart';
part 'championsState.g.dart';

class ChampionsState = _ChampionsStateBase with _$ChampionsState;

abstract class _ChampionsStateBase with Store {
  ObservableList<Champion> permanent = ObservableList<Champion>();

  @observable
  ObservableList<Champion> champions = ObservableList<Champion>();

  @observable
  Observable<String> searchKey = Observable('');

  @action
  Future<List<Champion>> loadChampions() async {
    var data = await fetchChampions();

    return data;
  }

  @action
  void updateChampions() {
    if (searchKey.value == '') {
      loadChampions().then((value) {
        champions = value.asObservable();
      });
    } else {
      champions = permanent
          .where((el) =>
              el.name.toLowerCase().contains(searchKey.value.toLowerCase()))
          .toList()
          .asObservable();
    }
  }

  @action
  void updatePermanent() {
    loadChampions().then((value) {
      permanent = value.asObservable();
    });
  }

  @action
  void updateList(List<Champion> l) {
    champions = l.asObservable();
  }

  @action
  void searchForChampion(String key) {
    searchKey.value = key;
    updateChampions();
  }
}
