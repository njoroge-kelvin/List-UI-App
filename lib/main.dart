import 'package:flutter/material.dart';

void main() {
  runApp(
      const MaterialApp(
        title: 'Test App',
          home: MyApp())
      );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Center(child: Text('Flutter')),)
    );
  }
}

