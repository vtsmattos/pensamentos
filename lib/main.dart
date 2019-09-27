import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pensamento_form/src/app_module.dart';
import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;

//void main() => runApp(AppModule());

void main(){
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(new AppModule());
}
