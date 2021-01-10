// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'championsState.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChampionsState on _ChampionsStateBase, Store {
  final _$championsAtom = Atom(name: '_ChampionsStateBase.champions');

  @override
  ObservableList<Champion> get champions {
    _$championsAtom.reportRead();
    return super.champions;
  }

  @override
  set champions(ObservableList<Champion> value) {
    _$championsAtom.reportWrite(value, super.champions, () {
      super.champions = value;
    });
  }

  final _$searchKeyAtom = Atom(name: '_ChampionsStateBase.searchKey');

  @override
  Observable<String> get searchKey {
    _$searchKeyAtom.reportRead();
    return super.searchKey;
  }

  @override
  set searchKey(Observable<String> value) {
    _$searchKeyAtom.reportWrite(value, super.searchKey, () {
      super.searchKey = value;
    });
  }

  final _$loadChampionsAsyncAction =
      AsyncAction('_ChampionsStateBase.loadChampions');

  @override
  Future<List<Champion>> loadChampions() {
    return _$loadChampionsAsyncAction.run(() => super.loadChampions());
  }

  final _$_ChampionsStateBaseActionController =
      ActionController(name: '_ChampionsStateBase');

  @override
  void updateChampions() {
    final _$actionInfo = _$_ChampionsStateBaseActionController.startAction(
        name: '_ChampionsStateBase.updateChampions');
    try {
      return super.updateChampions();
    } finally {
      _$_ChampionsStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePermanent() {
    final _$actionInfo = _$_ChampionsStateBaseActionController.startAction(
        name: '_ChampionsStateBase.updatePermanent');
    try {
      return super.updatePermanent();
    } finally {
      _$_ChampionsStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateList(List<Champion> l) {
    final _$actionInfo = _$_ChampionsStateBaseActionController.startAction(
        name: '_ChampionsStateBase.updateList');
    try {
      return super.updateList(l);
    } finally {
      _$_ChampionsStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchForChampion(String key) {
    final _$actionInfo = _$_ChampionsStateBaseActionController.startAction(
        name: '_ChampionsStateBase.searchForChampion');
    try {
      return super.searchForChampion(key);
    } finally {
      _$_ChampionsStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
champions: ${champions},
searchKey: ${searchKey}
    ''';
  }
}
