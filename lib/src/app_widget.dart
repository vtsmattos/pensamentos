import 'package:flutter/material.dart';
import 'package:pensamento_form/src/home/home_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slidy',
      theme: ThemeData(
        primaryColor: Color(0xff007989),
        accentColor: Color(0xff007989),
      ),
      home: HomeModule(),
    );
  }
}
