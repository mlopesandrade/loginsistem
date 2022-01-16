import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:testelogin/app/auth/auth_store.dart';
part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;
abstract class _SplashStoreBase with Store {

  AuthStore authStore;

  _SplashStoreBase(this.authStore){
    init();
  }

  init()async{
    Timer(const Duration(seconds: 3),()async{
      await authStore.getUserLogged();
      if(authStore.userLogged.email == null){
        Modular.to.pushNamedAndRemoveUntil('/login', (p0) => true);
      }else{
        Modular.to.pushNamedAndRemoveUntil('/home', (p0) => true);
      }

    });
  }

}