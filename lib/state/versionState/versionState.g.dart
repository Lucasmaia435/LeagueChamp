// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'versionState.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VersionState on _VersionStateBase, Store {
  final _$versionAtom = Atom(name: '_VersionStateBase.version');

  @override
  Observable<String> get version {
    _$versionAtom.reportRead();
    return super.version;
  }

  @override
  set version(Observable<String> value) {
    _$versionAtom.reportWrite(value, super.version, () {
      super.version = value;
    });
  }

  final _$_VersionStateBaseActionController =
      ActionController(name: '_VersionStateBase');

  @override
  void updateVersion() {
    final _$actionInfo = _$_VersionStateBaseActionController.startAction(
        name: '_VersionStateBase.updateVersion');
    try {
      return super.updateVersion();
    } finally {
      _$_VersionStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
version: ${version}
    ''';
  }
}
