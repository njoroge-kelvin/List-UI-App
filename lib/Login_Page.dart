
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

// ignore: camel_case_types
class _Login_PageState extends State<Login_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))
                ),
              ),),
            SizedBox(width: 200, height: 50,),
            Material(
                elevation: 5.0,
                color: Colors.blue,
                child: MaterialButton(onPressed: (){
                  Navigator.pushNamed(context, '/home_screen');
                },
                )
            )
          ],
        ),
      ),
    );
  }
}
