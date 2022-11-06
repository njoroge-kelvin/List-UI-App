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


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
                ListTile()
              ],
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: Text('AppBar'),
            bottom: TabBar(tabs: const[
              Tab(
                icon: Icon(size: 20.0, Icons.account_balance_rounded),
              ),
              Tab(
                icon: Icon(size: 20.0, Icons.add_call),
              ),
              Tab(
                icon: Icon(size: 20.0, Icons.accessible_forward_rounded),
              ),
              Tab(
                icon: Icon(size: 20.0, Icons.library_add_check_outlined),
              ),
            ]),
          ),
          body: TabBarView(children: [

            ListView.builder(
                itemCount: 100,
                prototypeItem: ListTile(leading: Icon(Icons.accessibility_rounded), trailing: Icon(Icons.airplane_ticket_rounded),title: Text(items.first),),
                itemBuilder: (context, index){
                  return ListTile(title: Text(items[index]),);
                }),
            Column(
              children: [
                Container(
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
                )
              ],
            ),
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
            ]),
            ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.add_alarm_outlined),
                  title: Text('Today is Monday'),),),
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
