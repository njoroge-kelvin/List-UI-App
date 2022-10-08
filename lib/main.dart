import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'List UI App',
    debugShowCheckedModeBanner: false,
    home: DefaultTabController(length: 3, child: ListApp()),
  ));
}

enum Menu {monday, tuesday, thursday}

const TextStyle menuStyle = TextStyle(color: Colors.black, fontSize: 13.0);

class ListApp extends StatefulWidget {
  const ListApp({Key? key}) : super(key: key);

  @override
  State<ListApp> createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {
  String _selectedMenu = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('AppBar'),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(size: 20.0, Icons.account_balance_rounded),
              child: PopupMenuButton(
                onSelected: (Menu item){
                  setState(() {
                    _selectedMenu = item.name;
                  });
                },
                itemBuilder: (BuildContext context) => <PopupMenuItem<Menu>>[
                  PopupMenuItem<Menu>(
                    value: Menu.monday,
                    child: Text(
                      'Monday',
                      style: menuStyle,
                    ),
                  ),
                  PopupMenuItem<Menu>(
                    value: Menu.tuesday,
                    child: Text(
                      'Tuesday',
                      style: menuStyle,
                    ),
                  ),
                  PopupMenuItem<Menu>(
                    value: Menu.thursday,
                    child: Text(
                      'Thursday',
                      style: menuStyle,
                    ),
                  ),
                ],
                child: Row(
                  children: [
                    Text(_selectedMenu),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            Tab(
              icon: Icon(size: 20.0, Icons.add_call),
            ),
            Tab(
              icon: Icon(size: 20.0, Icons.accessible_forward_rounded),
            ),
          ]),
        ),
        body: TabBarView(children: [
          ListView(scrollDirection: Axis.vertical, children: [
            for (var i = 0; i < 101; i++)
              Column(
                children: [
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    color: Colors.green,
                    child: Column(
                      children: [
                        Text(_selectedMenu),
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
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),]),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/images/Image1.jpg'),
                        child: GestureDetector(
                          onTap: () async {
                            await showDialog(context: context, builder: (_) => ItemList());
                        },
                        ),
                      ),
                      title: Text('Leading TextTile'),
                      subtitle: Text('This is a TextTile widget'),
                      trailing: Icon(Icons.ac_unit_outlined),
                      ),
                    ),
                  SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
          ])
        ]));
  }
}

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
          width: 100.0,
          height: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
              image: ExactAssetImage('assets/images/Image1.jpg'),
              fit: BoxFit.cover,
            ),
          ),),
    );
  }
}
