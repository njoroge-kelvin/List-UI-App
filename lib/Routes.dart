
import 'package:flutter/material.dart';
import 'package:i_am_trading/Login_Page.dart';
import 'MainApp.dart';
import 'Welcome_Screen.dart';



var customRoutes = <String, WidgetBuilder>{
  '/': (context) => Welcome_Screen(),
  '/login_screen': (context) => Login_Page(),
  '/home_screen': (context) => ListApp(),
};


