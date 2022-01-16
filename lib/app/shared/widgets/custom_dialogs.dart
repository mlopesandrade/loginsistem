import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomDialogs{

  static dialogError(BuildContext context,String text){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          Timer(Duration(seconds: 3),(){
            Modular.to.pop();
          });
          return AlertDialog(
            title: Text(text),
          );
        }
    );
  }

}