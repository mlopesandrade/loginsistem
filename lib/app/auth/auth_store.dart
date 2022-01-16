import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:testelogin/app/auth/auth_repository.dart';
import 'package:testelogin/app/shared/models/user_model.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;
abstract class _AuthStoreBase with Store {

 UserModel userLogged = UserModel();

 AuthRepository _authRepository;
 _AuthStoreBase(this._authRepository);

 Future getUserLogged()async{
  userLogged = await _authRepository.getUserLogged();
 }

 Future getLogin(String email,String password,BuildContext context)async{
  userLogged = await _authRepository.getLogin(email, password, context);
 }

 Future signOut()async{
  await _authRepository.signOut();
  userLogged = UserModel();
 }

}