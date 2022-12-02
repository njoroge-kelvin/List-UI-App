import 'package:flutter/material.dart';

class Centr extends StatefulWidget {
  const Centr({Key? key}) : super(key: key);

  @override
  State<Centr> createState() => _CentrState();
}

class _CentrState extends State<Centr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('This is your go to page', style: TextStyle(fontSize: 20, color:
        Theme.of(context).primaryColor),),
      ),
    );
  }
}

