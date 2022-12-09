import 'package:flutter/material.dart';

class Dump extends StatefulWidget {
  const Dump({Key? key}) : super(key: key);

  @override
  State<Dump> createState() => _DumpState();
}

class _DumpState extends State<Dump> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
    );
  }
}
