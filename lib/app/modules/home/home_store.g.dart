// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$rowsPerPageAtom = Atom(name: 'HomeStoreBase.rowsPerPage');

  @override
  int get rowsPerPage {
    _$rowsPerPageAtom.reportRead();
    return super.rowsPerPage;
  }

  @override
  set rowsPerPage(int value) {
    _$rowsPerPageAtom.reportWrite(value, super.rowsPerPage, () {
      super.rowsPerPage = value;
    });
  }

  final _$stateAtom = Atom(name: 'HomeStoreBase.state');

  @override
  String get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(String value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$statusScreenAtom = Atom(name: 'HomeStoreBase.statusScreen');

  @override
  StatusScreen get statusScreen {
    _$statusScreenAtom.reportRead();
    return super.statusScreen;
  }

  @override
  set statusScreen(StatusScreen value) {
    _$statusScreenAtom.reportWrite(value, super.statusScreen, () {
      super.statusScreen = value;
    });
  }

  final _$dataAtom = Atom(name: 'HomeStoreBase.data');

  @override
  ObservableList<DataModel> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ObservableList<DataModel> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  @override
  String toString() {
    return '''
rowsPerPage: ${rowsPerPage},
state: ${state},
statusScreen: ${statusScreen},
data: ${data}
    ''';
  }
}
