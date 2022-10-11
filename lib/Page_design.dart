
import 'package:flutter/material.dart';

class Page_Design extends StatefulWidget {
  const Page_Design({Key? key}) : super(key: key);


  @override
  State<Page_Design> createState() => _Page_DesignState();
}

class _Page_DesignState extends State<Page_Design> {
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




