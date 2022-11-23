import 'package:flutter/material.dart';


const TextStyle menuStyle = TextStyle(color: Colors.black, fontSize: 13.0);

class ListApp extends StatefulWidget {
  const ListApp({Key? key}) : super(key: key);


  @override
  State<ListApp> createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {
  int _selectedIndex = 0;


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
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 30),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            backgroundColor: Color(0xEC17674D),
            unselectedFontSize: 10,
            selectedFontSize: 15,
            elevation: 3.0,
            onTap: (int value){
              setState(() {
                _selectedIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.account_balance, color: Theme.of(context).primaryColor,), label: 'Navigate'),
              BottomNavigationBarItem(icon: Icon(Icons.add_business_sharp, color: Theme.of(context).primaryColor), label: 'Rush'),
              BottomNavigationBarItem(icon: Icon(Icons.add_a_photo_rounded, color: Theme.of(context).primaryColor), label: 'Check'),
            ],
          ),
        ),
      ),
    );
  }
}

