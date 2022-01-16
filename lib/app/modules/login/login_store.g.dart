// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$passwordVisualizedAtom =
      Atom(name: '_LoginStoreBase.passwordVisualized');

  @override
  bool get passwordVisualized {
    _$passwordVisualizedAtom.reportRead();
    return super.passwordVisualized;
  }

  @override
  set passwordVisualized(bool value) {
    _$passwordVisualizedAtom.reportWrite(value, super.passwordVisualized, () {
      super.passwordVisualized = value;
    });
  }

  final _$stateOnlyTextAtom = Atom(name: '_LoginStoreBase.stateOnlyText');

  @override
  ButtonState get stateOnlyText {
    _$stateOnlyTextAtom.reportRead();
    return super.stateOnlyText;
  }

  @override
  set stateOnlyText(ButtonState value) {
    _$stateOnlyTextAtom.reportWrite(value, super.stateOnlyText, () {
      super.stateOnlyText = value;
    });
  }

  final _$setLoginAsyncAction = AsyncAction('_LoginStoreBase.setLogin');

  @override
  Future setLogin(BuildContext context) {
    return _$setLoginAsyncAction.run(() => super.setLogin(context));
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  void setChangePasswordVisualized() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setChangePasswordVisualized');
    try {
      return super.setChangePasswordVisualized();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
passwordVisualized: ${passwordVisualized},
stateOnlyText: ${stateOnlyText}
    ''';
  }
}
