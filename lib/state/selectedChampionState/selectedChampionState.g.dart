// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selectedChampionState.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SelectedChampionState on _SelectedChampionStateBase, Store {
  final _$championAtom = Atom(name: '_SelectedChampionStateBase.champion');

  @override
  ChampionDetailed get champion {
    _$championAtom.reportRead();
    return super.champion;
  }

  @override
  set champion(ChampionDetailed value) {
    _$championAtom.reportWrite(value, super.champion, () {
      super.champion = value;
    });
  }

  final _$_SelectedChampionStateBaseActionController =
      ActionController(name: '_SelectedChampionStateBase');

  @override
  void selectChampion(String id) {
    final _$actionInfo = _$_SelectedChampionStateBaseActionController
        .startAction(name: '_SelectedChampionStateBase.selectChampion');
    try {
      return super.selectChampion(id);
    } finally {
      _$_SelectedChampionStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateChampion(ChampionDetailed c) {
    final _$actionInfo = _$_SelectedChampionStateBaseActionController
        .startAction(name: '_SelectedChampionStateBase.updateChampion');
    try {
      return super.updateChampion(c);
    } finally {
      _$_SelectedChampionStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void emptyChampion() {
    final _$actionInfo = _$_SelectedChampionStateBaseActionController
        .startAction(name: '_SelectedChampionStateBase.emptyChampion');
    try {
      return super.emptyChampion();
    } finally {
      _$_SelectedChampionStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
champion: ${champion}
    ''';
  }
}
