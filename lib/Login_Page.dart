import 'package:flutter/material.dart';

// ignore: camel_case_types
class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

// ignore: camel_case_types
class _Login_PageState extends State<Login_Page> {
  void _onPressed() {
    Navigator.pushNamed(context, '/home_screen');
  }

  //Method to open the registration page
  //Create a method to open forgot password below the password textinput.

  // void _onRepeat(){
  //  Navigator.push(context, Navigator.pushNamed(context, '/home_Screen'))
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.account_circle_sharp, size: 120, color: Colors.lightBlueAccent,),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              cursorColor: Colors.black,
              cursorHeight: 25,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 40),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.lightBlueAccent),
                  borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                hintText: 'Enter Email',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.lightBlueAccent),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15, left: 15, right: 15,top: 25),
            child: TextField(
              cursorColor: Colors.black,
              obscureText: true,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 40),
                hintText: 'Enter Password',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.lightBlueAccent),
                  borderRadius: BorderRadius.all(Radius.circular(50.0))
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.lightBlueAccent),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text('Forgot Password?'),
              )
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 30.0, left: 100.0, right: 100.0),
            child: Material(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              elevation: 5.0,
              color: Colors.lightBlue,
              child: MaterialButton(
                onPressed: _onPressed,
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 35, bottom: 60, left: 20, right: 20),
          child: Center(child: Text('Don\'t have an account')),),
          Row(
            children: const[
              Expanded(child: Divider(
                indent: 10,
                endIndent: 10,
                height: 10,
                thickness: 0.8,
              ),),
              Text('Or login with'),
              Expanded(child: Divider(
                indent:10,
                endIndent: 10,
                height: 10,
                thickness: 0.8,
              ),),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width:40,
                  height:40,
                  child: Image.network(
                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                      fit:BoxFit.cover
                  ),
                ),
                Icon(Icons.add_alarm_outlined),
                Icon(Icons.add_chart_sharp),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
