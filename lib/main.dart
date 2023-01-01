import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'Centr.dart';
import 'Login_Page.dart';
import 'MainApp.dart';
import 'Welcome_Screen.dart';

void main() async{

  // Firebase asynchronous initialization when app is started
  WidgetsFlutterBinding.ensureInitialized();
  //Waiting for firebase to instantiate using the async
  // and await futures.
  await Firebase.initializeApp();

  //Removes system statusBar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: [],);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
     MaterialColor color = MaterialColor(0xff90ee02, const<int, Color> {
      50:  Color(0xfff2fde4),//10%
      100:  Color(0xffdefabb),//20%
      200:  Color(0xffc6f68d),//30%
      300:  Color(0xffaaf255),//40%
      400:  Color(0xff90ee02),//50%
      500:  Color(0xff75e900),//60%
      600:  Color(0xff61d800),//70%
      700:  Color(0xff41c300),//80%
      800:  Color(0xff09af00),//90%
      900:  Color(0xff008b00),
    });

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: color,
        primaryColor: Color(0xff90ee02),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Theme.of(context).primaryColor)
        )
        // brightness: Brightness.dark
    ),
      title: 'List UI App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes:   <String, WidgetBuilder>{'/': (context) => Welcome_Screen(),
    '/login_screen': (context) => Login_Page(),
    '/home_screen': (context) => MainApp(),
    '/center': (context) =>Centr(),

      }
      // home: DefaultTabController(length: 3, child: ListApp()),
    );
  }
}




