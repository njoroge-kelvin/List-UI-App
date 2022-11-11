import 'package:flutter/material.dart';

//Represents list of popup menu.
class Menu {
  final String day;

  const Menu({required this.day});
}

final List<Menu> value = <Menu>[
  Menu(day: 'Monday'),
  Menu(day: 'Tuesday'),
  Menu(day: 'Wednesday'),
  Menu(day: 'Thursday'),
];

List items = List.generate(100, (index) => 'item: $index');

const TextStyle menuStyle = TextStyle(color: Colors.black, fontSize: 13.0);

class ListApp extends StatefulWidget {
  const ListApp({Key? key}) : super(key: key);


  @override
  State<ListApp> createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
        body: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 130,
                color: Colors.lightGreen,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(50)),
                            padding: EdgeInsets.all(5),
                            child: Icon(Icons.search)),
                        CircleAvatar(backgroundColor: Colors.black,)
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const[
                        Text('Hello Gabby'),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const[
                        Text('Choose your Bike', style: TextStyle(fontSize: 20, color: Colors.black87),)
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BottomNavigationBar(
            backgroundColor: Color(0xECE9E9FF),
            elevation: 1.0,
            onTap: (int value){
              setState(() {
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.accessibility_rounded), label: 'Navigate'),
              BottomNavigationBarItem(icon: Icon(Icons.accessibility_rounded), label: 'Rush'),
              BottomNavigationBarItem(icon: Icon(Icons.accessibility_rounded), label: 'Check'),
            ],
          ),
        ),
      ),
    );
  }
}

