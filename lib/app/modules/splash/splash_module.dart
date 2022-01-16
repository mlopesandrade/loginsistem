import 'package:testelogin/app/modules/splash/splash_Page.dart';
import 'package:testelogin/app/modules/splash/splash_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SplashStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashPage()),
  ];
}
