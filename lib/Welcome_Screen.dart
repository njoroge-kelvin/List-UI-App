import 'package:flutter/material.dart';
import 'Login_Page.dart';
import 'Routes.dart';

class Welcome_Screen extends StatelessWidget {
  const Welcome_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: (){
          Navigator.pushNamed(context, '/login_screen');
          // Navigator.pushNamed(context, 'login_screen');
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login_Page()));
        },
        child: Text('Welcome',
        style: TextStyle(color: Colors.blue, fontSize: 15.0,),),)
    );
  }
}
