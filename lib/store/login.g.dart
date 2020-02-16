// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Login on _LoginBase, Store {
  final _$apiEndPointAtom = Atom(name: '_LoginBase.apiEndPoint');

  @override
  String get apiEndPoint {
    _$apiEndPointAtom.context.enforceReadPolicy(_$apiEndPointAtom);
    _$apiEndPointAtom.reportObserved();
    return super.apiEndPoint;
  }

  @override
  set apiEndPoint(String value) {
    _$apiEndPointAtom.context.conditionallyRunInAction(() {
      super.apiEndPoint = value;
      _$apiEndPointAtom.reportChanged();
    }, _$apiEndPointAtom, name: '${_$apiEndPointAtom.name}_set');
  }

  final _$userAtom = Atom(name: '_LoginBase.user');

  @override
  String get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(String value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$chaveApiAtom = Atom(name: '_LoginBase.chaveApi');

  @override
  String get chaveApi {
    _$chaveApiAtom.context.enforceReadPolicy(_$chaveApiAtom);
    _$chaveApiAtom.reportObserved();
    return super.chaveApi;
  }

  @override
  set chaveApi(String value) {
    _$chaveApiAtom.context.conditionallyRunInAction(() {
      super.chaveApi = value;
      _$chaveApiAtom.reportChanged();
    }, _$chaveApiAtom, name: '${_$chaveApiAtom.name}_set');
  }

  final _$_LoginBaseActionController = ActionController(name: '_LoginBase');

  @override
  dynamic changeEndPoint(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.changeEndPoint(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeUser(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.changeUser(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeChaveApi(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.changeChaveApi(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'apiEndPoint: ${apiEndPoint.toString()},user: ${user.toString()},chaveApi: ${chaveApi.toString()}';
    return '{$string}';
  }
}
