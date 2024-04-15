import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SegmentWidget extends StatelessWidget {
  const SegmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.face),
        ),
        title: Text(
          "Frontier Airlines",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        subtitle: Text(
          "02h 46m",
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      ListTile(
        leading: CircleAvatar(child: Icon(Icons.face)),
        title: Row(
          children: [
            Text(
              "11:59 pm",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            SizedBox(width: 16),
            Text(
              "Las Vegas",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Text("30 Apr, Tue"),
            SizedBox(width: 21),
            Text("McCarran airport,DFW")
          ],
        ),
      ),
      ListTile(
        leading: CircleAvatar(child: Icon(Icons.face)),
        title: Row(
          children: [
            Text(
              "11:59 pm",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            SizedBox(width: 16),
            Text(
              "Las Vegas",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Text("30 Apr, Tue"),
            SizedBox(width: 21),
            Text("McCarran airport,DFW")
          ],
        ),
      ),
    ]);
  }
}
