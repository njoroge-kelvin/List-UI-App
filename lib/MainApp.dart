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
      expandedHeight: 200,
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
          SliverList(delegate: SliverChildBuilderDelegate(
            childCount: 40,
            (BuildContext context, int index){
            return ListTile(leading: Icon(Icons.add_business_sharp), title: Text('title'), trailing: Icon(
              Icons.add_a_photo_rounded
            ),);
          }))
        ],
      ),
    );
  }
}
