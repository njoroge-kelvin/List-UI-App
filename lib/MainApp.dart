import 'package:flutter/material.dart';

const TextStyle menuStyle = TextStyle(color: Colors.black, fontSize: 13.0);

class ListApp extends StatefulWidget {
  const ListApp({Key? key}) : super(key: key);

  @override
  State<ListApp> createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: 130,
              color: Theme.of(context).primaryColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50)),
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.search)),
                      CircleAvatar(
                        backgroundColor: Colors.black,
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text('Hello Gabby'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Choose your Bike',
                        style: TextStyle(fontSize: 20, color: Colors.black87),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
              height: size.height * 0.105,
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) =>
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 7),
                     child: TextButton(
                       style: TextButton.styleFrom(
                         foregroundColor: Theme.of(context).primaryColor,
                         backgroundColor: Theme.of(context).primaryColor,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(50)
                         ),
                       ),
                       onPressed: () {},
                       child: Container(
                         width: 70,
                         margin: EdgeInsets.symmetric(horizontal: 5),
                         child: Center(
                            child: Text(
                          'Touring',
                          style: TextStyle(color: Colors.black87, fontSize: 17),
                        )),
                       ),
                     ),
                   ),
                ),
              )),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).primaryColor,
          currentIndex: _selectedIndex,
          selectedIconTheme:
              IconThemeData(color: Theme.of(context).primaryColor),
          elevation: 3.0,
          onTap: (int value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), label: 'Navigate'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_business_sharp), label: 'Rush'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo_rounded), label: 'Check'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo_rounded), label: 'Check'),
          ],
        ),
      ),
    );
  }
}
