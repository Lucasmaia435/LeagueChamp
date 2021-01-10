import 'package:leagueChamp/service/api.dart';
import 'package:mobx/mobx.dart';

part 'versionState.g.dart';

class VersionState = _VersionStateBase with _$VersionState;

abstract class _VersionStateBase with Store {
  @observable
  Observable<String> version = Observable('');

  @action
  void updateVersion() {
    loadVersion().then((value) => version.value = value);
  }

  @action
  Future<String> loadVersion() async {
    String version = await fetchVersion();

    return version;
  }
}
