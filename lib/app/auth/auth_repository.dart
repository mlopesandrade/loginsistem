import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_storage/get_storage.dart';
import 'package:testelogin/app/shared/models/user_model.dart';
import 'package:testelogin/app/shared/widgets/custom_dialogs.dart';

class AuthRepository {

  final appdata = GetStorage();
  String bdData = 'userTeste';
  final Dio _dio = Dio();

  Future<UserModel> getUserLogged()async{
    var userLogged = await appdata.read(bdData);
    if(userLogged == null){
      return UserModel();
    }else{
      return UserModel.fromJson(userLogged);
    }
  }

  Future<void> saveUserLocale(UserModel user) async {
    appdata.write(bdData, user.toJson());
  }

  Future signOut()async{
    await appdata.remove(bdData);
  }

  Future<UserModel> getLogin(String? email,String? password,BuildContext context)async{
    try{
      if(email == 'teste@teste.com'){
        if(password == '12345678'){
          var user = UserModel(
              email: 'teste@teste.com',
              cpf: '12345678965'
          );
          saveUserLocale(user);
          return user;
        }else{
          await CustomDialogs.dialogError(context, 'Senha Invalida');
          return UserModel();
        }
      }else{
        await CustomDialogs.dialogError(context, 'Email não cadastrado');
        return UserModel();
      }
    }catch(e){
      print(e.toString());
      return UserModel();
    }
  }

}