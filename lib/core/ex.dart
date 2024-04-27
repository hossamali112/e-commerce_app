
import 'package:ecommerce_app_c10_frida/main.dart';
import 'package:flutter/material.dart';

extension navigator on Widget{
  void goTo( )=> Navigator.of(navigatorKey.currentContext!).push(MaterialPageRoute(builder: (context) {
    return this;
  },));
}
