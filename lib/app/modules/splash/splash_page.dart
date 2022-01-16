import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:testelogin/app/modules/splash/splash_store.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}
class SplashPageState extends State<SplashPage> {
  final SplashStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomInDown(
        child: const Center(
          child: FlutterLogo(
            size: 200,
          )
          // Image.asset(
          //   AssetsApp.logoColor,
          //   width: 200,
          //   height: 200,
          // ),
        ),
      ),
    );
  }
}