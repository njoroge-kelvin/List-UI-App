import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {


  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {



  @override
  Widget build(BuildContext context) {

    final SliverAppBar sliverAppBar = SliverAppBar(

        flexibleSpace: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: FlexibleSpaceBar(
          title: Text('sliverAppbar', style: TextStyle(color: Colors.white),),
          stretchModes: const <StretchMode> [
            StretchMode.zoomBackground,
            StretchMode.blurBackground,
            StretchMode.fadeTitle,
          ],

          background: Image.asset('assets/images/Image1.jpg', fit: BoxFit.cover,),
      ),
        ),

      floating: true,
      expandedHeight: 150,
      stretch: true,
      elevation: 3,
      automaticallyImplyLeading: false,
      pinned: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)

          )
      ),
    );


    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          sliverAppBar,
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,),
              child: SizedBox(
                height: 50,
                child:
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (_, index){
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        margin: EdgeInsets.only(right: 10),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                            ),
                            backgroundColor: Colors.grey,
                          ),
                            onPressed: (){}, child: Text('Create',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                            fontSize: 20),)),
                      );
                    }),
              ),
            ),
          ),
              SliverGrid(delegate: SliverChildBuilderDelegate((context, index)=>
                Stack(
                  children:
                  [
                    Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.green,
                    child: Center(
                      child: Text('This is a card'),),
                  ),]
                )
              ),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                  ))
        ],
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        child: BottomNavigationBar(
          items: const[
            BottomNavigationBarItem(
                label: 'Texas',
                icon: Icon(Icons.add_a_photo_rounded,)),
            BottomNavigationBarItem(
                label: 'Dallas',
                icon: Icon(Icons.add_a_photo_rounded,)),
            BottomNavigationBarItem(
                label: 'Mashinani',
                icon: Icon(Icons.add_a_photo_rounded,)),
          ],
        ),
      ),
    );
  }
}
