import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:i_am_trading/MainApp.dart';

import 'Login_Page.dart';
import 'MainApp.dart';
import 'Welcome_Screen.dart';
// import 'Login_Page.dart';

void main() async{
  // Firebase asynchronous initialization when app is started
  WidgetsFlutterBinding.ensureInitialized();
  //Waiting for firebase to start ints instance using the async
  // and await futures.
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red,),
      title: 'List UI App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes:   <String, WidgetBuilder>{'/': (context) => Welcome_Screen(),
    '/login_screen': (context) => Login_Page(),
    '/home_screen': (context) => ListApp(),}
      // home: DefaultTabController(length: 3, child: ListApp()),
    );
  }
}




