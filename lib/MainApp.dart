import 'package:flutter/material.dart';

//Represents list of popup menu.
class Menu {
  const Menu({required this.day});

  final String day;
}

final List<Menu> value = <Menu>[
  Menu(day: 'Monday'),
  Menu(day: 'Tuesday'),
  Menu(day: 'Wednesday'),
  Menu(day: 'Thursday'),
];

const TextStyle menuStyle = TextStyle(color: Colors.black, fontSize: 13.0);

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ListApp();
  }
}

class ListApp extends StatefulWidget {
  const ListApp({Key? key}) : super(key: key);

  @override
  State<ListApp> createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {
  String _selectedMenu = '';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.lightBlue),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 38.0),
                    child: Wrap(spacing: 70, children: const <Widget>[
                      Icon(
                        Icons.supervised_user_circle_rounded,
                        size: 40,
                      ),
                      Text(
                        'USER',
                        style: TextStyle(color: Colors.black87, fontSize: 30),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: Text('AppBar'),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(size: 20.0, Icons.account_balance_rounded),
                child: PopupMenuButton(
                  onSelected: (Menu value) {
                    setState(() {
                      _selectedMenu = value.day;
                    });
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuItem<Menu>>[
                    PopupMenuItem<Menu>(
                      child: Text(
                        '${value.length}',
                        style: menuStyle,
                      ),
                    ),
                    PopupMenuItem<Menu>(
                      value: value.last,
                      child: Text(
                        'Tuesday',
                        style: menuStyle,
                      ),
                    ),
                    PopupMenuItem<Menu>(
                      value: value.single,
                      child: Text(
                        '${value.length}',
                        style: menuStyle,
                      ),
                    ),
                  ],
                  child: Row(
                    children: [
                      Text(_selectedMenu),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Theme.of(context).primaryColor,
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ]),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/images/Image1.jpg'),
                        child: GestureDetector(
                          onTap: () async {
                            await showDialog(
                                context: context, builder: (_) => ItemList());
                          },
                        ),
                      ),
                      title: Text('Leading TextTile'),
                      subtitle: Text('This is a TextTile widget'),
                      trailing: Icon(Icons.ac_unit_outlined),
                    ),
                  ),
                ),
            ])
          ])),
    );
  }
}

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  int _selectedIndex = 0;

  _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.spatial_audio),
                  Text(
                    'This is your profile',
                  ),
                  CircleAvatar(
                    radius: 15,
                  ),
                ],
              ),
              Text('Lorem Ipsum is simply dummy text of the printing '
                  'and typesetting industry. Lorem Ipsum has been the industrys '
                  'standard dummy text ever since the 1500s, when an unknown printer but also the leap into electronic '
                  'typesetting, remaining essentially unchanged. It was popularised in the '),
              BottomNavigationBar(
                selectedItemColor: Colors.greenAccent,
                elevation: 1,
                onTap: _onItemTapped,
                currentIndex: _selectedIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.business),
                    label: 'Business',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.school),
                    label: 'School',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
