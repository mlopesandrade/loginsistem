import 'package:testelogin/app/app_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:testelogin/app/auth/auth_repository.dart';
import 'package:testelogin/app/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_store.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/splash/splash_module.dart';
import 'shared/utils/api.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AuthStore(i())),
    Bind((i) => AppStore(i())),
    Bind.lazySingleton((i) => AuthRepository()),
    Bind.lazySingleton((i) => AppRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/login', module: LoginModule()),
  ];
}
