import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'List UI App',
    debugShowCheckedModeBanner: false,
    home: DefaultTabController(length: 3, child: ListApp()),
  ));
}

class ListApp extends StatelessWidget {
  const ListApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('AppBar'),
          bottom: TabBar(tabs: const [
            Tab(
              icon: Icon(size: 20.0, Icons.account_balance_rounded),
            ),
            Tab(icon: Icon(size: 20.0, Icons.add_call),),
            Tab(icon: Icon(size: 20.0, Icons.accessible_forward_rounded),),
          ]),
        ),
        body: TabBarView(
          children: [
            ListView(scrollDirection: Axis.vertical, children: [
              for (var i = 0; i < 101; i++)
              Column(
                children: [
                  SizedBox(height: 5.0,),
                  Container(
                    color: Colors.green,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: Text('Item $i')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ]),
            ListView(scrollDirection: Axis.vertical, children: [
              for (var i = 0; i < 101; i++)
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: Text('Item $i')),
                  ),
                ),
            ]),
            ListView(scrollDirection: Axis.vertical, children: [
              for (var i = 0; i < 101; i++)
                Container(
                  color: Colors.orange,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: Text('Item $i')),
                  ),
                ),
            ])
          ]
        ));
  }
}

// class ItemList extends StatelessWidget {
//   const ItemList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Expanded(
//           flex: 1,
//           child: ListView(
//             scrollDirection:Axis.vertical,
//             children: [
//               for(var i = 0; i < 10; i++)
//                 Container(
//                   color: Colors.green,
//                     child: Text('Item $i')),
//            ]
//       )),
//     );
//   }
// }
