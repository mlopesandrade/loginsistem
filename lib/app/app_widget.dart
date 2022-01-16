import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/theme/theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slidy',
      theme: AppTheme.customTheme(),
    ).modular();
  }
}