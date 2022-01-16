import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:testelogin/app/auth/auth_store.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;
abstract class _LoginStoreBase with Store {

  @observable
  bool passwordVisualized = false;

  @observable
  ButtonState stateOnlyText = ButtonState.idle;

  String? email, password;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FocusNode usernameFocus = FocusNode();

  final FocusNode passwordFocus = FocusNode();

  AuthStore authStore;
  _LoginStoreBase(this.authStore);

  @action
  void setChangePasswordVisualized() => passwordVisualized = !passwordVisualized;

  @action
  setLogin(BuildContext context)async{
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    stateOnlyText = ButtonState.loading;
    var logado = false;
    if (formKey.currentState!.validate()){
      Timer(Duration(seconds: 3),()async{
        formKey.currentState!.save();
        await authStore.getLogin(email.toString(), password.toString(),context);
        if(authStore.userLogged.email != null){
          logado = true;
        }
        if (logado){
          stateOnlyText = ButtonState.success;
          Timer(const Duration(seconds: 2),(){
            Modular.to.pushNamedAndRemoveUntil('/home', (p0) => true);
            stateOnlyText = ButtonState.idle;
          });
        }else{
          stateOnlyText = ButtonState.fail;
          Timer(Duration(seconds: 2),(){
            stateOnlyText = ButtonState.idle;
          });
        }
      });
    } else {
      stateOnlyText = ButtonState.idle;
    }
  }

}